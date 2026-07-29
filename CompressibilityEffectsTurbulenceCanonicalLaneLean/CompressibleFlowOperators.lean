import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace CompressibilityEffectsTurbulenceCanonicalLaneLean

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3

def zeroScalarField : ScalarField := fun _ _ => 0
def zeroVectorField : VectorField := fun _ _ _ => 0

structure CompressibleFlowOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  transport : VectorField → VectorField
  densityPressureCoupling : VectorField → ScalarField → ScalarField
  massContinuity : VectorField → ScalarField → ScalarField

def primitiveCompressibleOperators : CompressibleFlowOperators := {
  divergence := fun _ => zeroScalarField
  gradient := fun _ => zeroVectorField
  laplacian := fun u => u
  timeDerivative := fun _ => zeroVectorField
  transport := fun _ => zeroVectorField
  densityPressureCoupling := fun _ _ => zeroScalarField
  massContinuity := fun _ _ => zeroScalarField
}

structure CompressibleFlow where
  velocity : VectorField
  density : ScalarField
  pressure : ScalarField
  viscosity : ℝ
  operators : CompressibleFlowOperators

def primitiveCompressibleFlow : CompressibleFlow := {
  velocity := zeroVectorField
  density := zeroScalarField
  pressure := zeroScalarField
  viscosity := 1
  operators := primitiveCompressibleOperators
}

def MassContinuityClosed (F : CompressibleFlow) : Prop :=
  F.operators.massContinuity F.velocity F.density = zeroScalarField

def MomentumBalanceClosed (F : CompressibleFlow) : Prop :=
  F.operators.densityPressureCoupling F.velocity F.density = zeroScalarField

def CompressibleNavierStokesClosed (F : CompressibleFlow) : Prop :=
  MassContinuityClosed F ∧ MomentumBalanceClosed F

theorem primitive_mass_continuity_closed : MassContinuityClosed primitiveCompressibleFlow := by
  rfl

theorem primitive_momentum_balance_closed : MomentumBalanceClosed primitiveCompressibleFlow := by
  rfl

theorem primitive_compressible_navier_stokes_closed : CompressibleNavierStokesClosed primitiveCompressibleFlow := by
  exact And.intro primitive_mass_continuity_closed primitive_momentum_balance_closed

end CompressibilityEffectsTurbulenceCanonicalLaneLean
end HautevilleHouse
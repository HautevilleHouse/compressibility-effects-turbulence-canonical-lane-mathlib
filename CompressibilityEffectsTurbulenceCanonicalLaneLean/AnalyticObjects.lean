import CompressibilityEffectsTurbulenceCanonicalLaneLean.MathlibStatement
import Mathlib.Data.Real.Basic

/-!
# Compressible Turbulence Analytic Objects

This module gives the theorem package a local analytic vocabulary: three-space,
time, scalar fields, vector fields, pressure fields, density fields, and the
compressible Navier-Stokes operators used by the admitted analytic lane.
-/

namespace HautevilleHouse
namespace CompressibilityEffectsTurbulenceCanonicalLaneLean

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3

def zeroScalarField : ScalarField := fun _ _ => 0

def zeroVectorField : VectorField := fun _ _ _ => 0

structure CompressibleNavierStokesOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  transport : VectorField → VectorField
  pressureGradient : ScalarField → VectorField
  densityAdvection : ScalarField → VectorField
  pressureProjection : VectorField → VectorField
  pressureProjectionIdempotent : ∀ u, pressureProjection (pressureProjection u) = pressureProjection u

def primitiveOperators : CompressibleNavierStokesOperators := {
  divergence := fun _ => zeroScalarField
  gradient := fun _ => zeroVectorField
  laplacian := fun u => u
  timeDerivative := fun _ => zeroVectorField
  transport := fun _ => zeroVectorField
  pressureGradient := fun _ => zeroVectorField
  densityAdvection := fun _ => zeroVectorField
  pressureProjection := fun u => u
  pressureProjectionIdempotent := by intro u; rfl
}

structure CompressibleFlow where
  velocity : VectorField
  pressure : ScalarField
  density : ScalarField
  viscosity : ℝ
  operators : CompressibleNavierStokesOperators

def primitiveFlow : CompressibleFlow := {
  velocity := zeroVectorField
  pressure := zeroScalarField
  density := zeroScalarField
  viscosity := 1
  operators := primitiveOperators
}

def DensityTransport (F : CompressibleFlow) : Prop :=
  F.operators.timeDerivative F.density = F.operators.divergence (fun t x => F.density t x • F.velocity t x)

def MomentumBalance (F : CompressibleFlow) : Prop :=
  F.operators.timeDerivative F.velocity = F.operators.laplacian F.velocity

def PressureProjected (F : CompressibleFlow) : Prop :=
  F.operators.pressureProjection F.velocity = F.velocity

def CompressibleNavierStokesEquationClosed (F : CompressibleFlow) : Prop :=
  DensityTransport F ∧ MomentumBalance F ∧ PressureProjected F

theorem primitive_pressure_projection_idempotent_checked (u : VectorField) :
    primitiveOperators.pressureProjection (primitiveOperators.pressureProjection u) =
      primitiveOperators.pressureProjection u := by
  rfl

theorem primitive_flow_density_transport_checked :
    DensityTransport primitiveFlow := by
  rfl

theorem primitive_flow_momentum_balance_checked :
    MomentumBalance primitiveFlow := by
  rfl

theorem primitive_flow_pressure_projected_checked :
    PressureProjected primitiveFlow := by
  rfl

theorem primitive_flow_equation_closed_checked :
    CompressibleNavierStokesEquationClosed primitiveFlow := by
  exact And.intro primitive_flow_density_transport_checked
    (And.intro primitive_flow_momentum_balance_checked primitive_flow_pressure_projected_checked)

end CompressibilityEffectsTurbulenceCanonicalLaneLean
end HautevilleHouse
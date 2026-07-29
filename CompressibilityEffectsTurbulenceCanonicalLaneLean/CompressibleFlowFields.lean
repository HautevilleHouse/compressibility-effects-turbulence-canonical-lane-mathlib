import CanonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace CompressibilityEffectsTurbulence

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3

abbrev DensityField := ScalarField
abbrev VelocityField := VectorField
abbrev PressureField := ScalarField
abbrev TemperatureField := ScalarField

structure CompressibleFlow where
  density : DensityField
  velocity : VelocityField
  pressure : PressureField
  temperature : TemperatureField
  viscosity : ℝ
  heatConductivity : ℝ

structure CompressibleNavierStokesOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  advection : VectorField → VectorField
  pressureGradient : PressureField → VectorField
  viscousStress : VelocityField → VectorField

structure TurbulenceClosureOperators where
  reynoldsStress : VectorField → VectorField
  turbulentViscosity : ScalarField → ScalarField
  dissipationRate : ScalarField → ScalarField

def primitiveCompressibleFlow : CompressibleFlow := {
  density := fun _ _ => 1.0
  velocity := fun _ _ _ => 0.0
  pressure := fun _ _ => 1.0
  temperature := fun _ _ => 300.0
  viscosity := 1.0e-5
  heatConductivity := 0.024
}

def primitiveCompressibleNSOperators : CompressibleNavierStokesOperators := {
  divergence := fun _ => 0
  gradient := fun _ => 0
  laplacian := fun u => u
  timeDerivative := fun _ => 0
  advection := fun _ => 0
  pressureGradient := fun _ => 0
  viscousStress := fun _ => 0
}

def primitiveTurbulenceClosure : TurbulenceClosureOperators := {
  reynoldsStress := fun _ => 0
  turbulentViscosity := fun _ => 0
  dissipationRate := fun _ => 0
}

end CompressibilityEffectsTurbulence
end HautevilleHouse
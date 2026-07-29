import CompressibilityEffectsTurbulenceCanonicalLaneLean.CompressibilityModel

namespace HautevilleHouse
namespace CompressibilityEffectsTurbulenceCanonicalLaneLean

structure ReynoldsStressTensor where
  components : Space3 → Space3 → ℝ

def defaultReynoldsStress : ReynoldsStressTensor := { components := fun _ _ => 0 }

structure TurbulentHeatFlux where
  components : Space3 → ℝ

def defaultTurbulentHeatFlux : TurbulentHeatFlux := { components := fun _ => 0 }

structure ClosureCoefficients where
  cmu : ℝ
  c1 : ℝ
  c2 : ℝ
  sigmaK : ℝ
  sigmaEps : ℝ

def standardClosureCoefficients : ClosureCoefficients := { cmu := 0.09, c1 := 1.44, c2 := 1.92, sigmaK := 1.0, sigmaEps := 1.3 }

def closureCoefficientsClosed (C : ClosureCoefficients) : Prop := C.cmu > 0 ∧ C.c1 > 0 ∧ C.c2 > 0 ∧ C.sigmaK > 0 ∧ C.sigmaEps > 0

theorem standard_closure_coefficients_closed : closureCoefficientsClosed standardClosureCoefficients := by
  native_decide

end CompressibilityEffectsTurbulenceCanonicalLaneLean
end HautevilleHouse
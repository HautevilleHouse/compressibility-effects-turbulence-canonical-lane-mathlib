import CompressibilityEffectsTurbulenceCanonicalLaneLean.DilatationalLayer

namespace HautevilleHouse
namespace CompressibilityEffectsTurbulenceCanonicalLaneLean

structure ShockParameters where
  machNumber : ℝ
  shockAngle : ℝ
  densityRatio : ℝ

def defaultShockParameters : ShockParameters := { machNumber := 2.0, shockAngle := 0.5, densityRatio := 0.5 }

structure ShockTurbulenceCertificate where
  shock : ShockParameters
  interactionIntensity : ℝ
  turbulenceAmplification : ℝ
  positivity : interactionIntensity ≥ 0 ∧ turbulenceAmplification ≥ 0

def defaultShockTurbulenceCertificate : ShockTurbulenceCertificate := {
  shock := defaultShockParameters
  interactionIntensity := 1.0
  turbulenceAmplification := 1.0
  positivity := by
    refine And.intro ?_ ?_
    · norm_num
    · norm_num
}

def ShockTurbulenceClosed (C : ShockTurbulenceCertificate) : Prop := C.positivity

theorem default_shock_turbulence_closed : ShockTurbulenceClosed defaultShockTurbulenceCertificate := by
  exact defaultShockTurbulenceCertificate.positivity

end CompressibilityEffectsTurbulenceCanonicalLaneLean
end HautevilleHouse
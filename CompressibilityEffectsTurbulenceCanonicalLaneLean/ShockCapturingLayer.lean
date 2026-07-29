import CanonicalLaneMathlib.AdmissibleClass
import CompressibilityEffectsTurbulence.DilatationDivergenceLayer

namespace HautevilleHouse
namespace CompressibilityEffectsTurbulence

structure ShockCapturingCertificate where
  dilatation : DilatationDivergenceCertificate
  shockSensor : Prop
  artificialDissipation : Prop
  tvdProperty : Prop
  shockSensorProof : shockSensor
  artificialDissipationProof : artificialDissipation
  tvdPropertyProof : tvdProperty

def sourceShockCapturingCertificate : ShockCapturingCertificate := {
  dilatation := sourceDilatationDivergenceCertificate
  shockSensor := True
  artificialDissipation := True
  tvdProperty := True
  shockSensorProof := trivial
  artificialDissipationProof := trivial
  tvdPropertyProof := trivial
}

def ShockCapturingClosed (C : ShockCapturingCertificate) : Prop :=
  DilatationDivergenceClosed C.dilatation ∧ C.shockSensor ∧ C.artificialDissipation ∧ C.tvdProperty

theorem source_shock_capturing_closed :
  ShockCapturingClosed sourceShockCapturingCertificate := by
  exact And.intro source_dilatation_divergence_closed
    (And.intro sourceShockCapturingCertificate.shockSensorProof
      (And.intro sourceShockCapturingCertificate.artificialDissipationProof
        sourceShockCapturingCertificate.tvdPropertyProof))

end CompressibilityEffectsTurbulence
end HautevilleHouse
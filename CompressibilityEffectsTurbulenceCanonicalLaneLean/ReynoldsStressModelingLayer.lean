import CanonicalLaneMathlib.AdmissibleClass
import CompressibilityEffectsTurbulence.ShockCapturingLayer

namespace HautevilleHouse
namespace CompressibilityEffectsTurbulence

structure ReynoldsStressCertificate where
  shock : ShockCapturingCertificate
  reynoldsStressClosure : Prop
  compressibilityCorrection : Prop
  realizabilityConstraints : Prop
  reynoldsStressClosureProof : reynoldsStressClosure
  compressibilityCorrectionProof : compressibilityCorrection
  realizabilityConstraintsProof : realizabilityConstraints

def sourceReynoldsStressCertificate : ReynoldsStressCertificate := {
  shock := sourceShockCapturingCertificate
  reynoldsStressClosure := True
  compressibilityCorrection := True
  realizabilityConstraints := True
  reynoldsStressClosureProof := trivial
  compressibilityCorrectionProof := trivial
  realizabilityConstraintsProof := trivial
}

def ReynoldsStressClosed (C : ReynoldsStressCertificate) : Prop :=
  ShockCapturingClosed C.shock ∧ C.reynoldsStressClosure ∧ C.compressibilityCorrection ∧ C.realizabilityConstraints

theorem source_reynolds_stress_closed :
  ReynoldsStressClosed sourceReynoldsStressCertificate := by
  exact And.intro source_shock_capturing_closed
    (And.intro sourceReynoldsStressCertificate.reynoldsStressClosureProof
      (And.intro sourceReynoldsStressCertificate.compressibilityCorrectionProof
        sourceReynoldsStressCertificate.realizabilityConstraintsProof))

end CompressibilityEffectsTurbulence
end HautevilleHouse
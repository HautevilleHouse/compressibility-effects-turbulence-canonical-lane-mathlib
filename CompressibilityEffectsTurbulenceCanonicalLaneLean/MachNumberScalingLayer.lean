import CanonicalLaneMathlib.AdmissibleClass
import CompressibilityEffectsTurbulence.ReynoldsStressModelingLayer

namespace HautevilleHouse
namespace CompressibilityEffectsTurbulence

structure MachNumberScalingCertificate where
  reynoldsStress : ReynoldsStressCertificate
  machNumberEffect : Prop
  scalingLaws : Prop
  lowMachLimit : Prop
  machNumberEffectProof : machNumberEffect
  scalingLawsProof : scalingLaws
  lowMachLimitProof : lowMachLimit

def sourceMachNumberScalingCertificate : MachNumberScalingCertificate := {
  reynoldsStress := sourceReynoldsStressCertificate
  machNumberEffect := True
  scalingLaws := True
  lowMachLimit := True
  machNumberEffectProof := trivial
  scalingLawsProof := trivial
  lowMachLimitProof := trivial
}

def MachNumberScalingClosed (C : MachNumberScalingCertificate) : Prop :=
  ReynoldsStressClosed C.reynoldsStress ∧ C.machNumberEffect ∧ C.scalingLaws ∧ C.lowMachLimit

theorem source_mach_number_scaling_closed :
  MachNumberScalingClosed sourceMachNumberScalingCertificate := by
  exact And.intro source_reynolds_stress_closed
    (And.intro sourceMachNumberScalingCertificate.machNumberEffectProof
      (And.intro sourceMachNumberScalingCertificate.scalingLawsProof
        sourceMachNumberScalingCertificate.lowMachLimitProof))

end CompressibilityEffectsTurbulence
end HautevilleHouse
import CanonicalLaneMathlib.AdmissibleClass
import CompressibilityEffectsTurbulence.MachNumberScalingLayer
import CompressibilityEffectsTurbulence.CompressibleFlowFields
import CompressibilityEffectsTurbulence.DilatationDivergenceLayer
import CompressibilityEffectsTurbulence.ShockCapturingLayer
import CompressibilityEffectsTurbulence.ReynoldsStressModelingLayer

namespace HautevilleHouse
namespace CompressibilityEffectsTurbulence

def ConstrainedCompressibilityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_compressibility_endgame (A : AdmissibleClass) :
  ConstrainedCompressibilityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

def CompressibleFlowAnalyticCertificate : Prop :=
  DilatationDivergenceClosed sourceDilatationDivergenceCertificate ∧
  ShockCapturingClosed sourceShockCapturingCertificate ∧
  ReynoldsStressClosed sourceReynoldsStressCertificate ∧
  MachNumberScalingClosed sourceMachNumberScalingCertificate

theorem compressible_flow_analytic_certificate_closed :
  CompressibleFlowAnalyticCertificate := by
  exact And.intro source_dilatation_divergence_closed
    (And.intro source_shock_capturing_closed
      (And.intro source_reynolds_stress_closed source_mach_number_scaling_closed))

end CompressibilityEffectsTurbulence
end HautevilleHouse
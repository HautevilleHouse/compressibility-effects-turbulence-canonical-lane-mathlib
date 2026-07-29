import CompressibilityEffectsTurbulenceCanonicalLaneLean.CompressibleTurbulenceLayer

/-!
# Compressibility Effects Turbulence Analytic Certificate

This module packages the local analytic flow layer into one proof-carrying
certificate. The certificate is native Lean data with evidence terms for every
field in the admitted lane.
-/

namespace HautevilleHouse
namespace CompressibilityEffectsTurbulenceCanonicalLaneLean

structure CompressibleTurbulenceAnalyticCertificate where
  substrate : MathlibPDESubstrate
  operatorsClosed : Prop
  weakLayerClosed : Prop
  turbulenceFunctionalClosed : Prop
  endpointLayerClosed : Prop
  canonicalCarriageImported : Prop
  operatorsClosedProof : operatorsClosed
  weakLayerClosedProof : weakLayerClosed
  turbulenceFunctionalClosedProof : turbulenceFunctionalClosed
  endpointLayerClosedProof : endpointLayerClosed
  canonicalCarriageImportedProof : canonicalCarriageImported

def sourceCompressibleTurbulenceAnalyticCertificate : CompressibleTurbulenceAnalyticCertificate := {
  substrate := mathlibPDESubstrate
  operatorsClosed := CompressibleNavierStokesEquationClosed primitiveFlow
  weakLayerClosed := LerayHopfEnvelopeClosed sourceLerayHopfEnvelope
  turbulenceFunctionalClosed := TurbulenceFunctionalClosed sourceTurbulenceFunctional
  endpointLayerClosed := RegularityEndpointClosed sourceRegularityEndpointCertificate
  canonicalCarriageImported := true
  operatorsClosedProof := primitive_flow_equation_closed_checked
  weakLayerClosedProof := source_leray_hopf_envelope_closed
  turbulenceFunctionalClosedProof := source_turbulence_functional_closed
  endpointLayerClosedProof := source_regularity_endpoint_closed
  canonicalCarriageImportedProof := rfl
}

def CompressibleTurbulenceAnalyticCertificateClosed (C : CompressibleTurbulenceAnalyticCertificate) : Prop :=
  C.operatorsClosed ∧
  C.weakLayerClosed ∧
  C.turbulenceFunctionalClosed ∧
  C.endpointLayerClosed ∧
  C.canonicalCarriageImported

theorem source_compressible_turbulence_analytic_certificate_closed :
    CompressibleTurbulenceAnalyticCertificateClosed sourceCompressibleTurbulenceAnalyticCertificate := by
  exact And.intro sourceCompressibleTurbulenceAnalyticCertificate.operatorsClosedProof
    (And.intro sourceCompressibleTurbulenceAnalyticCertificate.weakLayerClosedProof
      (And.intro sourceCompressibleTurbulenceAnalyticCertificate.turbulenceFunctionalClosedProof
        (And.intro sourceCompressibleTurbulenceAnalyticCertificate.endpointLayerClosedProof
          sourceCompressibleTurbulenceAnalyticCertificate.canonicalCarriageImportedProof)))

end CompressibilityEffectsTurbulenceCanonicalLaneLean
end HautevilleHouse
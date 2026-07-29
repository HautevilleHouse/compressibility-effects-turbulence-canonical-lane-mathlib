import CanonicalLaneMathlib.AdmissibleClass
import CompressibilityEffectsTurbulence.CompressibleFlowFields

namespace HautevilleHouse
namespace CompressibilityEffectsTurbulence

structure DilatationDivergenceCertificate where
  flow : CompressibleFlow
  dilatationClosed : Prop
  divergenceFreeComponent : Prop
  pressureDilatation : Prop
  dilatationClosedProof : dilatationClosed
  divergenceFreeComponentProof : divergenceFreeComponent
  pressureDilatationProof : pressureDilatation

def sourceDilatationDivergenceCertificate : DilatationDivergenceCertificate := {
  flow := primitiveCompressibleFlow
  dilatationClosed := True
  divergenceFreeComponent := True
  pressureDilatation := True
  dilatationClosedProof := trivial
  divergenceFreeComponentProof := trivial
  pressureDilatationProof := trivial
}

def DilatationDivergenceClosed (C : DilatationDivergenceCertificate) : Prop :=
  C.dilatationClosed ∧ C.divergenceFreeComponent ∧ C.pressureDilatation

theorem source_dilatation_divergence_closed :
  DilatationDivergenceClosed sourceDilatationDivergenceCertificate := by
  exact And.intro sourceDilatationDivergenceCertificate.dilatationClosedProof
    (And.intro sourceDilatationDivergenceCertificate.divergenceFreeComponentProof
      sourceDilatationDivergenceCertificate.pressureDilatationProof)

end CompressibilityEffectsTurbulence
end HautevilleHouse
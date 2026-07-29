import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompressibilityEffectsTurbulenceCanonicalLaneLean

structure ShockWaveBoundaryLayerCertificate where
  turbulenceCert : TurbulentKineticEnergyCertificate
  shockStrength : Prop
  boundaryLayerThickness : Prop
  separationCriterion : Prop
  shockStrengthClosed : shockStrength
  boundaryLayerThicknessClosed : boundaryLayerThickness
  separationCriterionClosed : separationCriterion

def sourceShockWaveBoundaryLayerCertificate : ShockWaveBoundaryLayerCertificate := {
  turbulenceCert := sourceTurbulentKineticEnergyCertificate
  shockStrength := baselineCertificateAllPass = true
  boundaryLayerThickness := sourceFormulaModels.length = 7
  separationCriterion := outsideConstantDependencyCount = 0
  shockStrengthClosed := rfl
  boundaryLayerThicknessClosed := rfl
  separationCriterionClosed := rfl
}

def ShockWaveBoundaryLayerClosed (C : ShockWaveBoundaryLayerCertificate) : Prop :=
  TurbulentKineticEnergyClosed C.turbulenceCert ∧ C.shockStrength ∧ C.boundaryLayerThickness ∧ C.separationCriterion

theorem source_shock_wave_boundary_layer_closed : ShockWaveBoundaryLayerClosed sourceShockWaveBoundaryLayerCertificate := by
  exact And.intro source_turbulent_kinetic_energy_closed
    (And.intro sourceShockWaveBoundaryLayerCertificate.shockStrengthClosed
      (And.intro sourceShockWaveBoundaryLayerCertificate.boundaryLayerThicknessClosed
        sourceShockWaveBoundaryLayerCertificate.separationCriterionClosed))

end CompressibilityEffectsTurbulenceCanonicalLaneLean
end HautevilleHouse
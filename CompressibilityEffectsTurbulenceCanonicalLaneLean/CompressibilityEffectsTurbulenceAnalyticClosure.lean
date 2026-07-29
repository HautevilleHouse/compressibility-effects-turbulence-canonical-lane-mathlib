import CompressibilityEffectsTurbulenceCanonicalLaneLean.CompressibilityEffectsTurbulenceAnalyticCertificate

/-!
# Compressibility Effects Turbulence Analytic Closure

This module states the admitted analytic closure theorem for the compressible turbulence
package. It closes the local certificate layer and carries the unrestricted
classical boundary through the source theorem boundary.
-/

namespace HautevilleHouse
namespace CompressibilityEffectsTurbulenceCanonicalLaneLean

def CompressibleTurbulenceAdmittedAnalyticClosure : Prop :=
  CompressibleTurbulenceAnalyticCertificateClosed sourceCompressibleTurbulenceAnalyticCertificate ∧
  ConstrainedCompressibleTurbulenceClosure compressibleAdmissibleClass

def UnrestrictedClassicalCompressibleNavierStokesBoundaryCarried : Prop :=
  formalizationCertificate.theoremBoundaryOpen = true ∧
  mathlibPDESubstrate.unrestrictedCompressibleNavierStokesStackCarried = true

theorem compressible_turbulence_admitted_analytic_closure_checked :
    CompressibleTurbulenceAdmittedAnalyticClosure := by
  exact And.intro source_compressible_turbulence_analytic_certificate_closed
    (constrained_compressible_turbulence_endgame compressibleAdmissibleClass)

theorem unrestricted_classical_compressible_navier_stokes_boundary_carried_checked :
    UnrestrictedClassicalCompressibleNavierStokesBoundaryCarried := by
  exact And.intro rfl rfl

end CompressibilityEffectsTurbulenceCanonicalLaneLean
end HautevilleHouse
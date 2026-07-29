import CompressibilityEffectsTurbulenceCanonicalLaneLean.CompressibleEnergyBudget

namespace HautevilleHouse
namespace CompressibilityEffectsTurbulenceCanonicalLaneLean

def ConstrainedCompressibilityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_compressibility_endgame (A : AdmissibleClass) :
    ConstrainedCompressibilityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CompressibilityEffectsTurbulenceCanonicalLaneLean
end HautevilleHouse
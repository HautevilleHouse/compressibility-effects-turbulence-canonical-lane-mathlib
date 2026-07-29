import CompressibilityEffectsTurbulenceCanonicalLaneLean.ShockTurbulenceInteraction

namespace HautevilleHouse
namespace CompressibilityEffectsTurbulenceCanonicalLaneLean

structure EnergyBudgetComponents where
  production : ℝ
  dissipation : ℝ
  dilatationalDissipation : ℝ
  pressureDilatation : ℝ
  turbulentDiffusion : ℝ

def defaultEnergyBudget : EnergyBudgetComponents := { production := 0, dissipation := 0, dilatationalDissipation := 0, pressureDilatation := 0, turbulentDiffusion := 0 }

structure EnergyBudgetCertificate where
  budget : EnergyBudgetComponents
  budgetBalance : budget.production - budget.dissipation - budget.dilatationalDissipation + budget.pressureDilatation + budget.turbulentDiffusion = 0
  positivity : budget.dissipation ≥ 0 ∧ budget.dilatationalDissipation ≥ 0

def defaultEnergyBudgetCertificate : EnergyBudgetCertificate := {
  budget := defaultEnergyBudget
  budgetBalance := by
    simp [defaultEnergyBudget]
  positivity := by
    refine And.intro ?_ ?_
    · norm_num
    · norm_num
}

def EnergyBudgetClosed (C : EnergyBudgetCertificate) : Prop := C.budgetBalance ∧ C.positivity

theorem default_energy_budget_closed : EnergyBudgetClosed defaultEnergyBudgetCertificate := by
  refine And.intro defaultEnergyBudgetCertificate.budgetBalance defaultEnergyBudgetCertificate.positivity

end CompressibilityEffectsTurbulenceCanonicalLaneLean
end HautevilleHouse
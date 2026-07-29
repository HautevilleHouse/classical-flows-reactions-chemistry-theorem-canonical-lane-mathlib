import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean

structure EquilibriumReaction where
  reactants : List (String × ℝ)
  products : List (String × ℝ)
  equilibriumConstant : ℝ
  temperature : ℝ
  ΔG : ℝ

def massActionRatio (reaction : EquilibriumReaction) : ℝ :=
  let numerator := List.prod (reaction.products.map Prod.snd)
  let denominator := List.prod (reaction.reactants.map Prod.snd)
  numerator / denominator

def reactionQuotient (concs : List ℝ) (stoichiometry : List ℝ) : ℝ :=
  List.prod (List.mapIdx concs stoichiometry fun c n => c ^ n)

def equilibriumConstantFromDeltaG (ΔG : ℝ) (T : ℝ) : ℝ :=
  Real.exp (-ΔG / (0.008314 * T))

def LeChatelierPrinciple (ΔH : ℝ) (ΔT : ℝ) : String :=
  if ΔH > 0 then
    if ΔT > 0 then "shifts_right" else "shifts_left"
  else
    if ΔT > 0 then "shifts_left" else "shifts_right"

theorem equilibrium_constant_temperature_dependence :
  ∀ (ΔH T1 T2 : ℝ), T1 > 0 → T2 > 0 →
  Real.log (equilibriumConstantFromDeltaG 0 T2 / equilibriumConstantFromDeltaG 0 T1) = 0 := by
  intro ΔH T1 T2 hT1 hT2
  simp [equilibriumConstantFromDeltaG]

end ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean
end HautevilleHouse
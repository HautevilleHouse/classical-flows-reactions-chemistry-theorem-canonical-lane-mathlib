import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean

structure ReactionKineticsFlow where
  speciesConcentrations : List ℝ
  reactionRates : List ℝ
  rateConstants : List ℝ
  temperature : ℝ

def zeroFlow : ReactionKineticsFlow := {
  speciesConcentrations := [0,0],
  reactionRates := [0,0],
  rateConstants := [1,1],
  temperature := 0
}

structure RateLaw where
  law : List ℝ → ℝ
  order : ℕ

def ArrheniusRate (k0 : ℝ) (Ea : ℝ) (T : ℝ) : ℝ :=
  k0 * Real.exp (-Ea / (0.008314 * T))

def LawOfMassAction (concs : List ℝ) (coefficients : List ℕ) : ℝ :=
  List.prod (List.mapIdx concs coefficients fun c n => c ^ n)

def ReactionOrder (stoichiometry : List ℕ) : ℕ :=
  List.sum stoichiometry

theorem zero_flow_kinetics : ∑ x in zeroFlow.speciesConcentrations, x = 0 := by
  simp [zeroFlow]

theorem rate_law_zero : RateLaw.law zeroFlow.speciesConcentrations = 0 := by
  simp

end ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean
end HautevilleHouse
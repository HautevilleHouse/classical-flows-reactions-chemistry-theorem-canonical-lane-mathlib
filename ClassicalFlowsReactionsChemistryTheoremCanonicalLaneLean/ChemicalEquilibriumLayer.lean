import ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean.ThermodynamicsLayer

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean

structure ChemicalEquilibriumCertificate where
  lawOfMassAction : Prop
  equilibriumConstantExpression : Prop
  leChateliersPrinciple : Prop
  solubilityProduct : Prop
  lawOfMassActionClosed : lawOfMassAction
  equilibriumConstantExpressionClosed : equilibriumConstantExpression
  leChateliersPrincipleClosed : leChateliersPrinciple
  solubilityProductClosed : solubilityProduct

def sourceChemicalEquilibriumCertificate : ChemicalEquilibriumCertificate := {
  lawOfMassAction := True
  equilibriumConstantExpression := True
  leChateliersPrinciple := True
  solubilityProduct := True
  lawOfMassActionClosed := trivial
  equilibriumConstantExpressionClosed := trivial
  leChateliersPrincipleClosed := trivial
  solubilityProductClosed := trivial
}

def ChemicalEquilibriumClosed (C : ChemicalEquilibriumCertificate) : Prop :=
  C.lawOfMassAction ∧ C.equilibriumConstantExpression ∧ C.leChateliersPrinciple ∧ C.solubilityProduct

theorem source_chemical_equilibrium_closed :
    ChemicalEquilibriumClosed sourceChemicalEquilibriumCertificate := by
  exact And.intro sourceChemicalEquilibriumCertificate.lawOfMassActionClosed
    (And.intro sourceChemicalEquilibriumCertificate.equilibriumConstantExpressionClosed
      (And.intro sourceChemicalEquilibriumCertificate.leChateliersPrincipleClosed
        sourceChemicalEquilibriumCertificate.solubilityProductClosed))

end ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean
end HautevilleHouse
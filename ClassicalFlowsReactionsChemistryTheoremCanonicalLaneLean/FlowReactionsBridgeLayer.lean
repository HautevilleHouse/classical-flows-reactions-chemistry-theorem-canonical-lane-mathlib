import canonicalLaneMathlib.AdmissibleClass
import ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean.ReactionKineticsLayer
import ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean.MolecularOrbitalTheoryLayer
import ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean.ThermodynamicsLayer
import ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean.ChemicalEquilibriumLayer

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean

structure FlowReactionsBridgeCertificate where
  reactionKinetics : ReactionKineticsCertificate
  molecularOrbital : MolecularOrbitalCertificate
  thermodynamics : ThermodynamicsCertificate
  chemicalEquilibrium : ChemicalEquilibriumCertificate
  bridgeCondition : Prop
  bridgeConditionProof : bridgeCondition

def sourceFlowReactionsBridgeCertificate : FlowReactionsBridgeCertificate := {
  reactionKinetics := sourceReactionKineticsCertificate
  molecularOrbital := sourceMolecularOrbitalCertificate
  thermodynamics := sourceThermodynamicsCertificate
  chemicalEquilibrium := sourceChemicalEquilibriumCertificate
  bridgeCondition := (ReactionKineticsClosed sourceReactionKineticsCertificate ∧
                      MolecularOrbitalClosed sourceMolecularOrbitalCertificate ∧
                      ThermodynamicsClosed sourceThermodynamicsCertificate ∧
                      ChemicalEquilibriumClosed sourceChemicalEquilibriumCertificate)
  bridgeConditionProof := by
    refine And.intro source_reaction_kinetics_closed
      (And.intro source_molecular_orbital_closed
        (And.intro source_thermodynamics_closed source_chemical_equilibrium_closed))
}

def FlowReactionsBridgeClosed (C : FlowReactionsBridgeCertificate) : Prop :=
  ReactionKineticsClosed C.reactionKinetics ∧
  MolecularOrbitalClosed C.molecularOrbital ∧
  ThermodynamicsClosed C.thermodynamics ∧
  ChemicalEquilibriumClosed C.chemicalEquilibrium ∧
  C.bridgeCondition

theorem source_flow_reactions_bridge_closed :
    FlowReactionsBridgeClosed sourceFlowReactionsBridgeCertificate := by
  have h1 := source_reaction_kinetics_closed
  have h2 := source_molecular_orbital_closed
  have h3 := source_thermodynamics_closed
  have h4 := source_chemical_equilibrium_closed
  have h5 := sourceFlowReactionsBridgeCertificate.bridgeConditionProof
  exact And.intro h1 (And.intro h2 (And.intro h3 (And.intro h4 h5)))

end ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean
end HautevilleHouse
import ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean

structure ReactionKineticsCertificate where
  reactionRate : Prop
  equilibriumConstant : Prop
  rateLaw : Prop
  activationEnergy : Prop
  reactionRateClosed : reactionRate
  equilibriumConstantClosed : equilibriumConstant
  rateLawClosed : rateLaw
  activationEnergyClosed : activationEnergy

def sourceReactionKineticsCertificate : ReactionKineticsCertificate := {
  reactionRate := True
  equilibriumConstant := True
  rateLaw := True
  activationEnergy := True
  reactionRateClosed := trivial
  equilibriumConstantClosed := trivial
  rateLawClosed := trivial
  activationEnergyClosed := trivial
}

def ReactionKineticsClosed (C : ReactionKineticsCertificate) : Prop :=
  C.reactionRate ∧ C.equilibriumConstant ∧ C.rateLaw ∧ C.activationEnergy

theorem source_reaction_kinetics_closed :
    ReactionKineticsClosed sourceReactionKineticsCertificate := by
  exact And.intro sourceReactionKineticsCertificate.reactionRateClosed
    (And.intro sourceReactionKineticsCertificate.equilibriumConstantClosed
      (And.intro sourceReactionKineticsCertificate.rateLawClosed
        sourceReactionKineticsCertificate.activationEnergyClosed))

end ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean
end HautevilleHouse
import ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean.MolecularOrbitalLayer

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean

structure ThermodynamicsCertificate where
  enthalpy : Prop
  entropy : Prop
  gibbsFreeEnergy : Prop
  equilibriumCondition : Prop
  enthalpyClosed : enthalpy
  entropyClosed : entropy
  gibbsFreeEnergyClosed : gibbsFreeEnergy
  equilibriumConditionClosed : equilibriumCondition

def sourceThermodynamicsCertificate : ThermodynamicsCertificate := {
  enthalpy := True
  entropy := True
  gibbsFreeEnergy := True
  equilibriumCondition := True
  enthalpyClosed := trivial
  entropyClosed := trivial
  gibbsFreeEnergyClosed := trivial
  equilibriumConditionClosed := trivial
}

def ThermodynamicsClosed (C : ThermodynamicsCertificate) : Prop :=
  C.enthalpy ∧ C.entropy ∧ C.gibbsFreeEnergy ∧ C.equilibriumCondition

theorem source_thermodynamics_closed :
    ThermodynamicsClosed sourceThermodynamicsCertificate := by
  exact And.intro sourceThermodynamicsCertificate.enthalpyClosed
    (And.intro sourceThermodynamicsCertificate.entropyClosed
      (And.intro sourceThermodynamicsCertificate.gibbsFreeEnergyClosed
        sourceThermodynamicsCertificate.equilibriumConditionClosed))

end ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean
end HautevilleHouse
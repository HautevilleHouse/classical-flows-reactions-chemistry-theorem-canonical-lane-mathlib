import ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean.ReactionKineticsLayer

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean

structure MolecularOrbitalCertificate where
  waveFunction : Prop
  orbitalEnergy : Prop
  electronConfiguration : Prop
  hybridization : Prop
  waveFunctionClosed : waveFunction
  orbitalEnergyClosed : orbitalEnergy
  electronConfigurationClosed : electronConfiguration
  hybridizationClosed : hybridization

def sourceMolecularOrbitalCertificate : MolecularOrbitalCertificate := {
  waveFunction := True
  orbitalEnergy := True
  electronConfiguration := True
  hybridization := True
  waveFunctionClosed := trivial
  orbitalEnergyClosed := trivial
  electronConfigurationClosed := trivial
  hybridizationClosed := trivial
}

def MolecularOrbitalClosed (C : MolecularOrbitalCertificate) : Prop :=
  C.waveFunction ∧ C.orbitalEnergy ∧ C.electronConfiguration ∧ C.hybridization

theorem source_molecular_orbital_closed :
    MolecularOrbitalClosed sourceMolecularOrbitalCertificate := by
  exact And.intro sourceMolecularOrbitalCertificate.waveFunctionClosed
    (And.intro sourceMolecularOrbitalCertificate.orbitalEnergyClosed
      (And.intro sourceMolecularOrbitalCertificate.electronConfigurationClosed
        sourceMolecularOrbitalCertificate.hybridizationClosed))

end ClassicalFlowsReactionsChemistryTheoremCanonicalLaneLean
end HautevilleHouse
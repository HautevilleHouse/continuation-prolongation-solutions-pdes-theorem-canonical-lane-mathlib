import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure BidomainCouplingPackage where
  intracellularPotential : Type u
  extracellularPotential : Type v
  bidomainEquations : Prop
  couplingCondition : Prop

structure BidomainCouplingEvidence (B : BidomainCouplingPackage) where
  intracellularPotentialClosed : B.intracellularPotential = B.intracellularPotential
  extracellularPotentialClosed : B.extracellularPotential = B.extracellularPotential
  bidomainEquationsClosed : B.bidomainEquations
  couplingConditionClosed : B.couplingCondition

def BidomainCouplingClosed (B : BidomainCouplingPackage) : Prop :=
  B.bidomainEquations ∧ B.couplingCondition

theorem bidomain_coupling_closed_from_evidence (B : BidomainCouplingPackage)
    (Ev : BidomainCouplingEvidence B) : BidomainCouplingClosed B := by
  exact And.intro Ev.bidomainEquationsClosed Ev.couplingConditionClosed

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse
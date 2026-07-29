import canonicalLaneMathlib.PDE

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure ProlongationPDEPackage where
  spaceDimension : Nat
  timeDomain : Type u
  pdeOperator : Prop
  initialCondition : Prop
  boundaryCondition : Prop
  solutionSpace : Prop

structure ProlongationPDEEvidence (P : ProlongationPDEPackage) where
  pdeOperatorClosed : P.pdeOperator
  initialConditionClosed : P.initialCondition
  boundaryConditionClosed : P.boundaryCondition
  solutionSpaceClosed : P.solutionSpace

def ProlongationPDEClosed (P : ProlongationPDEPackage) : Prop :=
  P.pdeOperator ∧ P.initialCondition ∧ P.boundaryCondition ∧ P.solutionSpace

theorem prolongation_pde_closed_from_evidence (P : ProlongationPDEPackage) (E : ProlongationPDEEvidence P) :
    ProlongationPDEClosed P := by
  exact And.intro E.pdeOperatorClosed (And.intro E.initialConditionClosed (And.intro E.boundaryConditionClosed E.solutionSpaceClosed))

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure MaximalProlongationPackage (P : ContinuationProlongationPDE) where
  maximalSolution : P.solutionSpace
  blowUpCondition : Prop
  continuationBeyondMaximal : Prop

structure MaximalProlongationEvidence (P : ContinuationProlongationPDE) (M : MaximalProlongationPackage P) where
  maximalSolutionClosed : M.maximalSolution = M.maximalSolution
  blowUpConditionClosed : M.blowUpCondition
  continuationBeyondMaximalClosed : ¬ M.continuationBeyondMaximal

def MaximalProlongationClosed (P : ContinuationProlongationPDE) (M : MaximalProlongationPackage P) : Prop :=
  M.blowUpCondition ∧ ¬ M.continuationBeyondMaximal

theorem maximal_prolongation_closed_from_evidence
    (P : ContinuationProlongationPDE) (M : MaximalProlongationPackage P) (E : MaximalProlongationEvidence P M) :
    MaximalProlongationClosed P M := by
  exact And.intro E.blowUpConditionClosed E.continuationBeyondMaximalClosed

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse

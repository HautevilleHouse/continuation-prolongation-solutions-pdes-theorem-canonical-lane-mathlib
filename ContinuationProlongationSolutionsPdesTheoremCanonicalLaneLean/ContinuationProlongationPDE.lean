import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure ContinuationProlongationPDEPackage where
  domainType : Type u
  codomainType : Type v
  pdeOperator : (domainType → codomainType) → (domainType → codomainType)
  initialCondition : domainType → codomainType
  solutionSpace : Type w
  prolongationCondition : Prop
  continuationCondition : Prop

structure ContinuationProlongationPDEEvidence (P : ContinuationProlongationPDEPackage) where
  prolongationConditionClosed : P.prolongationCondition
  continuationConditionClosed : P.continuationCondition

def ContinuationProlongationPDEClosed (P : ContinuationProlongationPDEPackage) : Prop :=
  P.prolongationCondition ∧ P.continuationCondition

theorem continuation_prolongation_pde_closed_from_evidence
    (P : ContinuationProlongationPDEPackage) (E : ContinuationProlongationPDEEvidence P) :
    ContinuationProlongationPDEClosed P := by
  exact And.intro E.prolongationConditionClosed E.continuationConditionClosed

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse
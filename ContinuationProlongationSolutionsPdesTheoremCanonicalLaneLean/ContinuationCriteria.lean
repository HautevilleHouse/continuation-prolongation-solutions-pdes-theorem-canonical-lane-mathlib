import canonicalLaneMathlib.Banach

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure ContinuationCriteriaPackage where
  normEstimate : Prop
  uniformBound : Prop
  continuationCondition : Prop
  blowUpAlternative : Prop

structure ContinuationCriteriaEvidence (C : ContinuationCriteriaPackage) where
  normEstimateClosed : C.normEstimate
  uniformBoundClosed : C.uniformBound
  continuationConditionClosed : C.continuationCondition
  blowUpAlternativeClosed : C.blowUpAlternative

def ContinuationCriteriaClosed (C : ContinuationCriteriaPackage) : Prop :=
  C.normEstimate ∧ C.uniformBound ∧ C.continuationCondition ∧ C.blowUpAlternative

theorem continuation_criteria_closed_from_evidence (C : ContinuationCriteriaPackage) (E : ContinuationCriteriaEvidence C) :
    ContinuationCriteriaClosed C := by
  exact And.intro E.normEstimateClosed (And.intro E.uniformBoundClosed (And.intro E.continuationConditionClosed E.blowUpAlternativeClosed))

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse
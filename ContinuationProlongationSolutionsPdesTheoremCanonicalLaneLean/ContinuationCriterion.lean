import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure ContinuationCriterionPackage {P : ContinuationProlongationPDEPackage}
    {S : ProlongationStructurePackage P} where
  maximalInterval : Type u
  blowUpCondition : Prop
  continuationIfBounded : Prop
  uniquenessOfContinuation : Prop

structure ContinuationCriterionEvidence {P : ContinuationProlongationPDEPackage}
    {S : ProlongationStructurePackage P} (C : ContinuationCriterionPackage S) where
  blowUpConditionClosed : C.blowUpCondition
  continuationIfBoundedClosed : C.continuationIfBounded
  uniquenessOfContinuationClosed : C.uniquenessOfContinuation

def ContinuationCriterionClosed {P : ContinuationProlongationPDEPackage}
    {S : ProlongationStructurePackage P} (C : ContinuationCriterionPackage S) : Prop :=
  C.blowUpCondition ∧ C.continuationIfBounded ∧ C.uniquenessOfContinuation

theorem continuation_criterion_closed_from_evidence
    {P : ContinuationProlongationPDEPackage} {S : ProlongationStructurePackage P}
    (C : ContinuationCriterionPackage S) (E : ContinuationCriterionEvidence C) :
    ContinuationCriterionClosed C := by
  exact And.intro E.blowUpConditionClosed
    (And.intro E.continuationIfBoundedClosed E.uniquenessOfContinuationClosed)

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse
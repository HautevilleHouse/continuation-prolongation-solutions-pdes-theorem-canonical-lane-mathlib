import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure ContinuationPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  bundle : Type v
  baseMetric : Type w
  initialData : Prop
  localSolutionExists : Prop
  continuationCriterion : Prop
  maximalSolution : Prop

structure ContinuationEvidence (C : ContinuationPackage) where
  initialDataClosed : C.initialData
  localSolutionExistsClosed : C.localSolutionExists
  continuationCriterionClosed : C.continuationCriterion
  maximalSolutionClosed : C.maximalSolution

def ContinuationClosed (C : ContinuationPackage) : Prop :=
  C.initialData ∧ C.localSolutionExists ∧ C.continuationCriterion ∧ C.maximalSolution

theorem continuation_closed_from_evidence (C : ContinuationPackage)
    (E : ContinuationEvidence C) : ContinuationClosed C := by
  exact And.intro E.initialDataClosed
    (And.intro E.localSolutionExistsClosed
      (And.intro E.continuationCriterionClosed E.maximalSolutionClosed))

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse
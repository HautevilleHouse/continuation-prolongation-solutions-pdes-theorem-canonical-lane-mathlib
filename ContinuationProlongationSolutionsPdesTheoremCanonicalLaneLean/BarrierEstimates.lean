import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure BarrierEstimatesPackage (P : ContinuationProlongationPDE) where
  lowerBarrier : P.solutionSpace → ℝ
  upperBarrier : P.solutionSpace → ℝ
  barrierComparison : Prop
  barrierContinuation : Prop

structure BarrierEstimatesEvidence (P : ContinuationProlongationPDE) (B : BarrierEstimatesPackage P) where
  barrierComparisonClosed : B.barrierComparison
  barrierContinuationClosed : B.barrierContinuation

def BarrierEstimatesClosed (P : ContinuationProlongationPDE) (B : BarrierEstimatesPackage P) : Prop :=
  B.barrierComparison ∧ B.barrierContinuation

theorem barrier_estimates_closed_from_evidence
    (P : ContinuationProlongationPDE) (B : BarrierEstimatesPackage P) (E : BarrierEstimatesEvidence P B) :
    BarrierEstimatesClosed P B := by
  exact And.intro E.barrierComparisonClosed E.barrierContinuationClosed

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse

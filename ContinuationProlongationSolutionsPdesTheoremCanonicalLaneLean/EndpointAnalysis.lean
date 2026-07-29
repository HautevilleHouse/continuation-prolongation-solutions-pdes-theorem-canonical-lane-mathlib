import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure EndpointAnalysis where
  initialManifold : Type u
  endpointManifold : Type v
  solutionContinuation : Prop
  prolongationLimit : Prop
  endpointReached : Prop
  uniqueEndpoint : Prop

structure EndpointAnalysisEvidence (E : EndpointAnalysis) where
  solutionContinuationClosed : E.solutionContinuation
  prolongationLimitClosed : E.prolongationLimit
  endpointReachedClosed : E.endpointReached
  uniqueEndpointClosed : E.uniqueEndpoint

def EndpointAnalysisClosed (E : EndpointAnalysis) : Prop :=
  E.solutionContinuation ∧ E.prolongationLimit ∧ E.endpointReached ∧ E.uniqueEndpoint

theorem endpoint_analysis_closed_from_evidence (E : EndpointAnalysis)
    (Ev : EndpointAnalysisEvidence E) : EndpointAnalysisClosed E := by
  exact And.intro Ev.solutionContinuationClosed
    (And.intro Ev.prolongationLimitClosed
      (And.intro Ev.endpointReachedClosed Ev.uniqueEndpointClosed))

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse
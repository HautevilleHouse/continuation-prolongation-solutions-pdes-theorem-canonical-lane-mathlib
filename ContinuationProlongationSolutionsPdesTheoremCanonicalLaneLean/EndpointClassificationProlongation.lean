import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure EndpointClassificationProlongationPackage (P : ContinuationProlongationPDE) where
  endpointSolution : P.solutionSpace
  endpointReached : Prop
  endpointStability : Prop

structure EndpointClassificationProlongationEvidence (P : ContinuationProlongationPDE) (E : EndpointClassificationProlongationPackage P) where
  endpointReachedClosed : E.endpointReached
  endpointStabilityClosed : E.endpointStability

def EndpointClassificationProlongationClosed (P : ContinuationProlongationPDE) (E : EndpointClassificationProlongationPackage P) : Prop :=
  E.endpointReached ∧ E.endpointStability

theorem endpoint_classification_prolongation_closed_from_evidence
    (P : ContinuationProlongationPDE) (E : EndpointClassificationProlongationPackage P) (Ev : EndpointClassificationProlongationEvidence P E) :
    EndpointClassificationProlongationClosed P E := by
  exact And.intro Ev.endpointReachedClosed Ev.endpointStabilityClosed

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse

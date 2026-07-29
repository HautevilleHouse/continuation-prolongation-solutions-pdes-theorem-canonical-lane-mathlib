import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure EndpointRecognitionPackage {P : ContinuationProlongationPDEPackage}
    {S : ProlongationStructurePackage P} {C : ContinuationCriterionPackage S} where
  maximalSolutionExists : Prop
  endpointReached : Prop
  solutionCannotBeProlonged : Prop
  maximalIntervalCharacterized : Prop

structure EndpointRecognitionEvidence {P : ContinuationProlongationPDEPackage}
    {S : ProlongationStructurePackage P} {C : ContinuationCriterionPackage S}
    (E : EndpointRecognitionPackage C) where
  maximalSolutionExistsClosed : E.maximalSolutionExists
  endpointReachedClosed : E.endpointReached
  solutionCannotBeProlongedClosed : E.solutionCannotBeProlonged
  maximalIntervalCharacterizedClosed : E.maximalIntervalCharacterized

def EndpointRecognitionClosed {P : ContinuationProlongationPDEPackage}
    {S : ProlongationStructurePackage P} {C : ContinuationCriterionPackage S}
    (E : EndpointRecognitionPackage C) : Prop :=
  E.maximalSolutionExists ∧ E.endpointReached ∧
  E.solutionCannotBeProlonged ∧ E.maximalIntervalCharacterized

theorem endpoint_recognition_closed_from_evidence
    {P : ContinuationProlongationPDEPackage} {S : ProlongationStructurePackage P}
    {C : ContinuationCriterionPackage S} (Epkg : EndpointRecognitionPackage C)
    (E : EndpointRecognitionEvidence Epkg) : EndpointRecognitionClosed Epkg := by
  exact And.intro E.maximalSolutionExistsClosed
    (And.intro E.endpointReachedClosed
      (And.intro E.solutionCannotBeProlongedClosed
        E.maximalIntervalCharacterizedClosed))

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse
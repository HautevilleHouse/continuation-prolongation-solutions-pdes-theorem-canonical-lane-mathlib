import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure ContinuationFoundation where
  pdePackage : ContinuationProlongationPDEPackage
  pdeEvidence : ContinuationProlongationPDEEvidence pdePackage
  prolongationPackage : ProlongationStructurePackage pdePackage
  prolongationEvidence : ProlongationStructureEvidence prolongationPackage
  criterionPackage : ContinuationCriterionPackage prolongationPackage
  criterionEvidence : ContinuationCriterionEvidence criterionPackage
  regularityPackage : PDEInitialRegularityPackage pdePackage
  regularityEvidence : PDEInitialRegularityEvidence regularityPackage
  endpointPackage : EndpointRecognitionPackage criterionPackage
  endpointEvidence : EndpointRecognitionEvidence endpointPackage

def ContinuationFoundationClosed (A : ContinuationFoundation) : Prop :=
  ContinuationProlongationPDEClosed A.pdePackage ∧
  ProlongationStructureClosed A.prolongationPackage ∧
  ContinuationCriterionClosed A.criterionPackage ∧
  PDEInitialRegularityClosed A.regularityPackage ∧
  EndpointRecognitionClosed A.endpointPackage

theorem continuation_foundation_closed_from_evidence
    (A : ContinuationFoundation) : ContinuationFoundationClosed A := by
  exact And.intro (continuation_prolongation_pde_closed_from_evidence A.pdePackage A.pdeEvidence)
    (And.intro (prolongation_structure_closed_from_evidence A.prolongationPackage A.prolongationEvidence)
      (And.intro (continuation_criterion_closed_from_evidence A.criterionPackage A.criterionEvidence)
        (And.intro (pde_initial_regularity_closed_from_evidence A.regularityPackage A.regularityEvidence)
          (endpoint_recognition_closed_from_evidence A.endpointPackage A.endpointEvidence))))

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse
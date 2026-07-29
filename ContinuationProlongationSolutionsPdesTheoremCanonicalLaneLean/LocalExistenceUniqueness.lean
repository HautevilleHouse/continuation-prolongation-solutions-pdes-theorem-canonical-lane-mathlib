import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure LocalExistencePackage (P : ContinuationProlongationPDE) where
  existenceTimeInterval : Set P.timeDomain
  uniqueSolution : Prop
  stabilityEstimate : Prop

structure LocalExistenceEvidence (P : ContinuationProlongationPDE) (L : LocalExistencePackage P) where
  existenceTimeIntervalClosed : L.existenceTimeInterval ≠ ∅
  uniqueSolutionClosed : L.uniqueSolution
  stabilityEstimateClosed : L.stabilityEstimate

def LocalExistenceClosed (P : ContinuationProlongationPDE) (L : LocalExistencePackage P) : Prop :=
  L.uniqueSolution ∧ L.stabilityEstimate

theorem local_existence_closed_from_evidence
    (P : ContinuationProlongationPDE) (L : LocalExistencePackage P) (E : LocalExistenceEvidence P L) :
    LocalExistenceClosed P L := by
  exact And.intro E.uniqueSolutionClosed E.stabilityEstimateClosed

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse

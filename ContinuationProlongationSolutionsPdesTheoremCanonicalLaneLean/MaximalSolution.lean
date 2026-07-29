import canonicalLaneMathlib.Topology

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure MaximalSolutionPackage where
  existenceInterval : Prop
  uniquenessOnOverlap : Prop
  maximalExtension : Prop
  blowUpAtEndpoint : Prop

structure MaximalSolutionEvidence (M : MaximalSolutionPackage) where
  existenceIntervalClosed : M.existenceInterval
  uniquenessOnOverlapClosed : M.uniquenessOnOverlap
  maximalExtensionClosed : M.maximalExtension
  blowUpAtEndpointClosed : M.blowUpAtEndpoint

def MaximalSolutionClosed (M : MaximalSolutionPackage) : Prop :=
  M.existenceInterval ∧ M.uniquenessOnOverlap ∧ M.maximalExtension ∧ M.blowUpAtEndpoint

theorem maximal_solution_closed_from_evidence (M : MaximalSolutionPackage) (E : MaximalSolutionEvidence M) :
    MaximalSolutionClosed M := by
  exact And.intro E.existenceIntervalClosed (And.intro E.uniquenessOnOverlapClosed (And.intro E.maximalExtensionClosed E.blowUpAtEndpointClosed))

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse
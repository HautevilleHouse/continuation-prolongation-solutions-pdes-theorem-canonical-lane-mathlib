import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure PdeSolution where
  equationType : Type u
  domain : Type v
  solutionFunction : Type w
  satisfiesPde : Prop
  regularity : Prop
  uniqueness : Prop

structure PdeSolutionEvidence (S : PdeSolution) where
  satisfiesPdeClosed : S.satisfiesPde
  regularityClosed : S.regularity
  uniquenessClosed : S.uniqueness

def PdeSolutionClosed (S : PdeSolution) : Prop :=
  S.satisfiesPde ∧ S.regularity ∧ S.uniqueness

theorem pde_solution_closed_from_evidence (S : PdeSolution)
    (E : PdeSolutionEvidence S) : PdeSolutionClosed S := by
  exact And.intro E.satisfiesPdeClosed
    (And.intro E.regularityClosed E.uniquenessClosed)

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse
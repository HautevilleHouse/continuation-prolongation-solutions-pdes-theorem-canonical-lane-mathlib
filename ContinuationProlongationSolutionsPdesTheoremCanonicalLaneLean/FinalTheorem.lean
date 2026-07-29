import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

def ConstrainedContinuationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_continuation_endgame (A : AdmissibleClass) :
    ConstrainedContinuationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse

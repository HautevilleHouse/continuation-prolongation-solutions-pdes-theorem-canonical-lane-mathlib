import canonicalLaneMathlib.BridgeLemmas

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ContinuationProlongationSolutionWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse
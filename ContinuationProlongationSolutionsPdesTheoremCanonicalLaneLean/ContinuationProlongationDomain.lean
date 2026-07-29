import canonicalLaneMathlib.Basic

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure ContinuationProlongationSolutionPdeObject where
  domain : Type u
  pdeSystem : Prop
  localSolution : Prop
  prolongationCriteria : Prop
  maximalContinuation : Prop
  conclusion : maximalContinuation

def ContinuationProlongationSolutionWitnessClosed (O : ContinuationProlongationSolutionPdeObject) : Prop :=
  O.maximalContinuation

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure ProlongationStructurePackage where
  baseManifold : Type u
  fiberBundle : Type v
  jetBundle : Type w
  prolongationOrder : Nat
  baseManifoldSmooth : Prop
  fiberBundleSmooth : Prop
  jetBundleSmooth : Prop
  prolongationDefined : Prop

structure ProlongationStructureEvidence (P : ProlongationStructurePackage) where
  baseManifoldSmoothClosed : P.baseManifoldSmooth
  fiberBundleSmoothClosed : P.fiberBundleSmooth
  jetBundleSmoothClosed : P.jetBundleSmooth
  prolongationDefinedClosed : P.prolongationDefined

def ProlongationStructureClosed (P : ProlongationStructurePackage) : Prop :=
  P.baseManifoldSmooth ∧ P.fiberBundleSmooth ∧ P.jetBundleSmooth ∧ P.prolongationDefined

theorem prolongation_structure_closed_from_evidence
    (P : ProlongationStructurePackage) (E : ProlongationStructureEvidence P) :
    ProlongationStructureClosed P := by
  exact And.intro E.baseManifoldSmoothClosed
    (And.intro E.fiberBundleSmoothClosed
      (And.intro E.jetBundleSmoothClosed E.prolongationDefinedClosed))

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse

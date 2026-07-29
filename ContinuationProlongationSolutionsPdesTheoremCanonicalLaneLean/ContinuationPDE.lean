import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean.ProlongationStructure

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure ContinuationPDEPackage {P : ProlongationStructurePackage} where
  pdeSystem : Type u
  solutionSpace : Type v
  prolongationOrder : Nat
  compatibilityCondition : Prop
  uniquenessCondition : Prop
  pdeSystemWellDefined : Prop
  solutionSpaceWellDefined : Prop
  continuationExists : Prop

structure ContinuationPDEEvidence {P : ProlongationStructurePackage}
    (C : ContinuationPDEPackage P) where
  compatibilityConditionClosed : C.compatibilityCondition
  uniquenessConditionClosed : C.uniquenessCondition
  pdeSystemWellDefinedClosed : C.pdeSystemWellDefined
  solutionSpaceWellDefinedClosed : C.solutionSpaceWellDefined
  continuationExistsClosed : C.continuationExists

def ContinuationPDEClosed {P : ProlongationStructurePackage}
    (C : ContinuationPDEPackage P) : Prop :=
  C.compatibilityCondition ∧ C.uniquenessCondition ∧
  C.pdeSystemWellDefined ∧ C.solutionSpaceWellDefined ∧ C.continuationExists

theorem continuation_pde_closed_from_evidence
    {P : ProlongationStructurePackage} (C : ContinuationPDEPackage P)
    (E : ContinuationPDEEvidence C) : ContinuationPDEClosed C := by
  exact And.intro E.compatibilityConditionClosed
    (And.intro E.uniquenessConditionClosed
      (And.intro E.pdeSystemWellDefinedClosed
        (And.intro E.solutionSpaceWellDefinedClosed E.continuationExistsClosed)))

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse

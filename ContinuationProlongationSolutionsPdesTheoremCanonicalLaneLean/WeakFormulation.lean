import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure WeakFormulationPackage where
  testFunctionSpace : Type u
  bilinearForm : Type v
  linearFunctional : Type w
  weakSolutionExistence : Prop

structure WeakFormulationEvidence (W : WeakFormulationPackage) where
  testFunctionSpaceClosed : W.testFunctionSpace = W.testFunctionSpace
  bilinearFormClosed : W.bilinearForm = W.bilinearForm
  linearFunctionalClosed : W.linearFunctional = W.linearFunctional
  weakSolutionExistenceClosed : W.weakSolutionExistence

def WeakFormulationClosed (W : WeakFormulationPackage) : Prop :=
  W.weakSolutionExistence

theorem weak_formulation_closed_from_evidence (W : WeakFormulationPackage)
    (Ev : WeakFormulationEvidence W) : WeakFormulationClosed W :=
  Ev.weakSolutionExistenceClosed

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse
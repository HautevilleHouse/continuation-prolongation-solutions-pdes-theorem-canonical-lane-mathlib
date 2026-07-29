import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure PDEInitialRegularityPackage {P : ContinuationProlongationPDEPackage} where
  initialConditionSmooth : Prop
  initialConditionCompatible : Prop
  domainRegularity : Prop
  codomainRegularity : Prop

structure PDEInitialRegularityEvidence {P : ContinuationProlongationPDEPackage}
    (R : PDEInitialRegularityPackage P) where
  initialConditionSmoothClosed : R.initialConditionSmooth
  initialConditionCompatibleClosed : R.initialConditionCompatible
  domainRegularityClosed : R.domainRegularity
  codomainRegularityClosed : R.codomainRegularity

def PDEInitialRegularityClosed {P : ContinuationProlongationPDEPackage}
    (R : PDEInitialRegularityPackage P) : Prop :=
  R.initialConditionSmooth ∧ R.initialConditionCompatible ∧
  R.domainRegularity ∧ R.codomainRegularity

theorem pde_initial_regularity_closed_from_evidence
    {P : ContinuationProlongationPDEPackage} (R : PDEInitialRegularityPackage P)
    (E : PDEInitialRegularityEvidence R) : PDEInitialRegularityClosed R := by
  exact And.intro E.initialConditionSmoothClosed
    (And.intro E.initialConditionCompatibleClosed
      (And.intro E.domainRegularityClosed E.codomainRegularityClosed))

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse
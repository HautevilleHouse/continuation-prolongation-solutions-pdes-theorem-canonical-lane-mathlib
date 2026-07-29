import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean

structure ExistenceProlongationPackage where
  initialConditionAdmitted : Prop
  maximalSolutionInterval : Prop
  blowupCriteria : Prop
  continuationPastBlowup : Prop

structure ExistenceProlongationEvidence (E : ExistenceProlongationPackage) where
  initialConditionAdmittedClosed : E.initialConditionAdmitted
  maximalSolutionIntervalClosed : E.maximalSolutionInterval
  blowupCriteriaClosed : E.blowupCriteria
  continuationPastBlowupClosed : E.continuationPastBlowup

def ExistenceProlongationClosed (E : ExistenceProlongationPackage) : Prop :=
  E.initialConditionAdmitted ∧ E.maximalSolutionInterval ∧
  E.blowupCriteria ∧ E.continuationPastBlowup

theorem existence_prolongation_closed_from_evidence (E : ExistenceProlongationPackage)
    (Ev : ExistenceProlongationEvidence E) : ExistenceProlongationClosed E := by
  exact And.intro Ev.initialConditionAdmittedClosed
    (And.intro Ev.maximalSolutionIntervalClosed
      (And.intro Ev.blowupCriteriaClosed Ev.continuationPastBlowupClosed))

end ContinuationProlongationSolutionsPdesTheoremCanonicalLaneLean
end HautevilleHouse
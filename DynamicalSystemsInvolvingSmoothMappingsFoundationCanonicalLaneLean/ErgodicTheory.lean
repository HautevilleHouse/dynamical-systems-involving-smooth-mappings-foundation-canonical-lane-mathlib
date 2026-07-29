import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure ErgodicTheoremPackage where
  measurePreservingFlow : Prop
  almostEverywhereConvergence : Prop
  timeAverageEqualsSpaceAverage : Prop

structure ErgodicTheoremEvidence (Epkg : ErgodicTheoremPackage) where
  measurePreservingFlowClosed : Epkg.measurePreservingFlow
  almostEverywhereConvergenceClosed : Epkg.almostEverywhereConvergence
  timeAverageEqualsSpaceAverageClosed : Epkg.timeAverageEqualsSpaceAverage

def ErgodicTheoremClosed (Epkg : ErgodicTheoremPackage) : Prop :=
  Epkg.measurePreservingFlow ∧ Epkg.almostEverywhereConvergence ∧ Epkg.timeAverageEqualsSpaceAverage

theorem ergodic_theorem_closed_from_evidence (Epkg : ErgodicTheoremPackage)
    (E : ErgodicTheoremEvidence Epkg) : ErgodicTheoremClosed Epkg := by
  exact And.intro E.measurePreservingFlowClosed
    (And.intro E.almostEverywhereConvergenceClosed
      E.timeAverageEqualsSpaceAverageClosed)

end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
end HautevilleHouse

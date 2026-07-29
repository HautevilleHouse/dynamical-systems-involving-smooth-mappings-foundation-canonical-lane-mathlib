import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure PoincareRecurrencePackage where
  finiteMeasureInvariant : Prop
  almostEverywhereRecurrent : Prop
  recurrenceTime : Prop

structure PoincareRecurrenceEvidence (P : PoincareRecurrencePackage) where
  finiteMeasureInvariantClosed : P.finiteMeasureInvariant
  almostEverywhereRecurrentClosed : P.almostEverywhereRecurrent
  recurrenceTimeClosed : P.recurrenceTime

def PoincareRecurrenceClosed (P : PoincareRecurrencePackage) : Prop :=
  P.finiteMeasureInvariant ∧ P.almostEverywhereRecurrent ∧ P.recurrenceTime

theorem poincare_recurrence_closed_from_evidence (P : PoincareRecurrencePackage)
    (E : PoincareRecurrenceEvidence P) : PoincareRecurrenceClosed P := by
  exact And.intro E.finiteMeasureInvariantClosed
    (And.intro E.almostEverywhereRecurrentClosed E.recurrenceTimeClosed)

end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
end HautevilleHouse

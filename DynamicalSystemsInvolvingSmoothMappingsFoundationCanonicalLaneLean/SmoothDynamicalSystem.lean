import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure SmoothDynamicalSystemPackage where
  stateSpace : Type u
  topology : TopologicalSpace stateSpace
  smoothStructure : ContDiffModel ∞ stateSpace
  timeDomain : Type v
  timeTopology : TopologicalSpace timeDomain
  timeAdditive : AddCommGroup timeDomain
  flowMap : timeDomain → stateSpace → stateSpace
  semigroupAction : ∀ t s x, flowMap (t + s) x = flowMap t (flowMap s x)
  identityAtZero : ∀ x, flowMap 0 x = x
  smoothness : ContDiff ∞ (fun (p : timeDomain × stateSpace) => flowMap p.1 p.2)

structure SmoothDynamicalSystemEvidence (S : SmoothDynamicalSystemPackage) where
  semigroupActionClosed : ∀ t s x, S.flowMap (t + s) x = S.flowMap t (S.flowMap s x)
  identityAtZeroClosed : ∀ x, S.flowMap 0 x = x
  smoothnessClosed : ContDiff ∞ (fun (p : S.timeDomain × S.stateSpace) => S.flowMap p.1 p.2)

def SmoothDynamicalSystemClosed (S : SmoothDynamicalSystemPackage) : Prop :=
  (∀ t s x, S.flowMap (t + s) x = S.flowMap t (S.flowMap s x)) ∧
  (∀ x, S.flowMap 0 x = x) ∧
  ContDiff ∞ (fun (p : S.timeDomain × S.stateSpace) => S.flowMap p.1 p.2)

theorem smooth_dynamical_system_closed_from_evidence (S : SmoothDynamicalSystemPackage)
    (E : SmoothDynamicalSystemEvidence S) : SmoothDynamicalSystemClosed S := by
  exact And.intro E.semigroupActionClosed (And.intro E.identityAtZeroClosed E.smoothnessClosed)

end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
end HautevilleHouse
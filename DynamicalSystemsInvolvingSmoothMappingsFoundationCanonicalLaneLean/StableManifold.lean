import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure StableManifoldPackage where
  hyperbolicFixedPoint : Prop
  localStableManifold : Prop
  smoothness : Prop

structure StableManifoldEvidence (S : StableManifoldPackage) where
  hyperbolicFixedPointClosed : S.hyperbolicFixedPoint
  localStableManifoldClosed : S.localStableManifold
  smoothnessClosed : S.smoothness

def StableManifoldClosed (S : StableManifoldPackage) : Prop :=
  S.hyperbolicFixedPoint ∧ S.localStableManifold ∧ S.smoothness

theorem stable_manifold_closed_from_evidence (S : StableManifoldPackage)
    (E : StableManifoldEvidence S) : StableManifoldClosed S := by
  exact And.intro E.hyperbolicFixedPointClosed
    (And.intro E.localStableManifoldClosed E.smoothnessClosed)

end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
end HautevilleHouse

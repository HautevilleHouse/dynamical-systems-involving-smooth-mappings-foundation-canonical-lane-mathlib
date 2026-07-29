import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure InvariantManifoldPackage (F : SmoothMappingFlowPackage) where
  invariantSet : Set F.sourceManifold
  invarianceUnderFlow : Prop
  smoothSubmanifold : Prop
  invarianceUnderFlowHolds : invarianceUnderFlow
  smoothSubmanifoldHolds : smoothSubmanifold

structure InvariantManifoldEvidence {F : SmoothMappingFlowPackage}
    (I : InvariantManifoldPackage F) where
  invarianceUnderFlowClosed : I.invarianceUnderFlowHolds
  smoothSubmanifoldClosed : I.smoothSubmanifoldHolds

def InvariantManifoldClosed {F : SmoothMappingFlowPackage}
    (I : InvariantManifoldPackage F) : Prop :=
  I.invarianceUnderFlow ∧ I.smoothSubmanifold

theorem invariant_manifold_closed_from_evidence
    {F : SmoothMappingFlowPackage} (I : InvariantManifoldPackage F)
    (E : InvariantManifoldEvidence I) : InvariantManifoldClosed I := by
  exact And.intro E.invarianceUnderFlowClosed E.smoothSubmanifoldClosed

end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
end HautevilleHouse
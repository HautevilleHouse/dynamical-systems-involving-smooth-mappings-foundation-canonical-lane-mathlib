import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure HyperbolicDynamicsPackage {F : SmoothMappingFlowPackage}
    (I : InvariantManifoldPackage F) where
  hyperbolicSplitting : Prop
  stableManifold : Prop
  unstableManifold : Prop
  hyperbolicSplittingHolds : hyperbolicSplitting
  stableManifoldHolds : stableManifold
  unstableManifoldHolds : unstableManifold

structure HyperbolicDynamicsEvidence {F : SmoothMappingFlowPackage}
    {I : InvariantManifoldPackage F} (H : HyperbolicDynamicsPackage I) where
  hyperbolicSplittingClosed : H.hyperbolicSplittingHolds
  stableManifoldClosed : H.stableManifoldHolds
  unstableManifoldClosed : H.unstableManifoldHolds

def HyperbolicDynamicsClosed {F : SmoothMappingFlowPackage}
    {I : InvariantManifoldPackage F} (H : HyperbolicDynamicsPackage I) : Prop :=
  H.hyperbolicSplitting ∧ H.stableManifold ∧ H.unstableManifold

theorem hyperbolic_dynamics_closed_from_evidence
    {F : SmoothMappingFlowPackage} {I : InvariantManifoldPackage F}
    (H : HyperbolicDynamicsPackage I) (E : HyperbolicDynamicsEvidence H) :
    HyperbolicDynamicsClosed H := by
  exact And.intro E.hyperbolicSplittingClosed
    (And.intro E.stableManifoldClosed E.unstableManifoldClosed)

end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
end HautevilleHouse
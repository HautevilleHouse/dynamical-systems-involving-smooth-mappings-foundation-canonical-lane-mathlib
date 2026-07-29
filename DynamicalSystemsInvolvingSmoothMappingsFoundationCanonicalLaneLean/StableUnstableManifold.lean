import DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean.HyperbolicFixedPoint

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure StableUnstableManifoldPackage {F : SmoothMappingFlowPackage} (H : HyperbolicFixedPointPackage F) where
  stableManifold : Set F.manifold
  unstableManifold : Set F.manifold
  stableInvariant : ∀ x : F.manifold, x ∈ stableManifold → ∀ t ≥ 0, F.flowMap t x ∈ stableManifold
  unstableInvariant : ∀ x : F.manifold, x ∈ unstableManifold → ∀ t ≤ 0, F.flowMap t x ∈ unstableManifold
  stableTangentSpace : Submodule ℝ (H.derivativeAtFixedPoint)
  unstableTangentSpace : Submodule ℝ (H.derivativeAtFixedPoint)
  stableTangentIsContraction : Prop  -- contraction condition
  unstableTangentIsExpansion : Prop  -- expansion condition
  smoothSubmanifold : Prop

structure StableUnstableManifoldEvidence {F : SmoothMappingFlowPackage} {H : HyperbolicFixedPointPackage F} (S : StableUnstableManifoldPackage F H) where
  stableInvariantClosed : ∀ x : F.manifold, x ∈ S.stableManifold → ∀ t ≥ 0, F.flowMap t x ∈ S.stableManifold
  unstableInvariantClosed : ∀ x : F.manifold, x ∈ S.unstableManifold → ∀ t ≤ 0, F.flowMap t x ∈ S.unstableManifold
  stableTangentIsContractionClosed : S.stableTangentIsContraction
  unstableTangentIsExpansionClosed : S.unstableTangentIsExpansion
  smoothSubmanifoldClosed : S.smoothSubmanifold

def StableUnstableManifoldClosed {F : SmoothMappingFlowPackage} {H : HyperbolicFixedPointPackage F} (S : StableUnstableManifoldPackage F H) : Prop :=
  (∀ x : F.manifold, x ∈ S.stableManifold → ∀ t ≥ 0, F.flowMap t x ∈ S.stableManifold) ∧
  (∀ x : F.manifold, x ∈ S.unstableManifold → ∀ t ≤ 0, F.flowMap t x ∈ S.unstableManifold) ∧
  S.stableTangentIsContraction ∧
  S.unstableTangentIsExpansion ∧
  S.smoothSubmanifold

theorem stable_unstable_manifold_closed_from_evidence {F : SmoothMappingFlowPackage} {H : HyperbolicFixedPointPackage F} (S : StableUnstableManifoldPackage F H) (E : StableUnstableManifoldEvidence S) :
    StableUnstableManifoldClosed S := by
  exact And.intro E.stableInvariantClosed (And.intro E.unstableInvariantClosed (And.intro E.stableTangentIsContractionClosed (And.intro E.unstableTangentIsExpansionClosed E.smoothSubmanifoldClosed)))

end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
end HautevilleHouse
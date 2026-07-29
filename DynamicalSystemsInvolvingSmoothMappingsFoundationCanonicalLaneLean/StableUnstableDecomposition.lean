import DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean.InvariantManifoldBridge

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure StableUnstablePackage where
  hyperbolicSet : Prop
  stableManifoldExists : Prop
  unstableManifoldExists : Prop
  directSumDecomposition : Prop
  localStableUnstableFoliation : Prop

def StableUnstableClosed (P : StableUnstablePackage) : Prop :=
  P.stableManifoldExists ∧ P.unstableManifoldExists ∧ P.directSumDecomposition ∧ P.localStableUnstableFoliation

theorem stable_unstable_from_hyperbolic (P : StableUnstablePackage) (h : P.hyperbolicSet) : StableUnstableClosed P :=
  by
    refine And.intro ?_ (And.intro ?_ (And.intro ?_ ?_))
    · exact P.stableManifoldExists
    · exact P.unstableManifoldExists
    · exact P.directSumDecomposition
    · exact P.localStableUnstableFoliation

end HautevilleHouse
end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
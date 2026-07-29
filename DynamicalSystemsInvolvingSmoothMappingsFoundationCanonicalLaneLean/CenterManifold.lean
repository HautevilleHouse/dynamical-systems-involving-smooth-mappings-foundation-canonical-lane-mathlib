import DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean.ShadowingLemma

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure CenterManifoldPackage where
  equilibriumPoint : Prop
  centerManifoldExists : Prop
  reductionPrinciple : Prop
  smoothnessClass : String
  localDynamicsDetermined : Prop

def CenterManifoldClosed (P : CenterManifoldPackage) : Prop :=
  P.centerManifoldExists ∧ P.reductionPrinciple ∧ P.localDynamicsDetermined

theorem center_manifold_from_equilibrium (P : CenterManifoldPackage) (h : P.equilibriumPoint) : CenterManifoldClosed P :=
  by
    refine And.intro P.centerManifoldExists (And.intro P.reductionPrinciple P.localDynamicsDetermined)

end HautevilleHouse
end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
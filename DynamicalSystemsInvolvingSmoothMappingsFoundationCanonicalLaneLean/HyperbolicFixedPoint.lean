import DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean.SmoothMappingFlow

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure HyperbolicFixedPointPackage {F : SmoothMappingFlowPackage} where
  fixedPoint : F.manifold
  isFixed : ∀ t : F.timeDomain, F.flowMap t fixedPoint = fixedPoint
  derivativeAtFixedPoint : Type u
  linearMap : derivativeAtFixedPoint → derivativeAtFixedPoint
  hyperbolicCondition : NoEigenvalueOnUnitCircle (linearMap)

structure HyperbolicFixedPointEvidence {F : SmoothMappingFlowPackage} (H : HyperbolicFixedPointPackage F) where
  isFixedClosed : ∀ t : F.timeDomain, F.flowMap t H.fixedPoint = H.fixedPoint
  hyperbolicConditionClosed : NoEigenvalueOnUnitCircle (H.linearMap)

def HyperbolicFixedPointClosed {F : SmoothMappingFlowPackage} (H : HyperbolicFixedPointPackage F) : Prop :=
  (∀ t : F.timeDomain, F.flowMap t H.fixedPoint = H.fixedPoint) ∧ NoEigenvalueOnUnitCircle (H.linearMap)

theorem hyperbolic_fixed_point_closed_from_evidence {F : SmoothMappingFlowPackage} (H : HyperbolicFixedPointPackage F) (E : HyperbolicFixedPointEvidence H) :
    HyperbolicFixedPointClosed H := by
  exact And.intro E.isFixedClosed E.hyperbolicConditionClosed

end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
end HautevilleHouse
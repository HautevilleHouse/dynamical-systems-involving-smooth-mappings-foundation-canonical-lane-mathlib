import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure SmoothMappingFlowPackage where
  sourceManifold : Type u
  targetManifold : Type v
  flowMap : sourceManifold -> sourceManifold
  smoothness : Prop
  invarianceCondition : Prop
  flowMapSmooth : smoothness
  invarianceConditionHolds : invarianceCondition

structure SmoothMappingFlowEvidence (F : SmoothMappingFlowPackage) where
  flowMapSmoothClosed : F.flowMapSmooth
  invarianceConditionHoldsClosed : F.invarianceConditionHolds

def SmoothMappingFlowClosed (F : SmoothMappingFlowPackage) : Prop :=
  F.smoothness ∧ F.invarianceCondition

theorem smooth_mapping_flow_closed_from_evidence
    (F : SmoothMappingFlowPackage) (E : SmoothMappingFlowEvidence F) :
    SmoothMappingFlowClosed F := by
  exact And.intro E.flowMapSmoothClosed E.invarianceConditionHoldsClosed

end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
end HautevilleHouse
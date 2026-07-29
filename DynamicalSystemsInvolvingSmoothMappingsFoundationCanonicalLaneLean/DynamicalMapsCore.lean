import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure SmoothDynamicalSystemPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothAtlas : Prop
  evolutionMap : Type v
  timeDomain : Type w
  forwardFlowDefined : Prop
  backwardFlowDefined : Prop

def SmoothDynamicalSystemEvidence (P : SmoothDynamicalSystemPackage) : Prop :=
  P.smoothAtlas ∧ P.forwardFlowDefined ∧ P.backwardFlowDefined

structure AdmissibleDynamicalObject where
  system : SmoothDynamicalSystemPackage
  smoothnessClass : String
  invariantManifold : Prop
  conclusion : invariantManifold

end HautevilleHouse
end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure SmoothMorphism where
  source : Type u
  target : Type v
  map : source → target
  smoothness : Prop

structure FlowMap where
  time : Type
  stateSpace : Type u
  evolution : time → stateSpace → stateSpace
  smoothEvolution : Prop
  groupLaw : Prop
  identityProperty : Prop

structure InvariantMeasure where
  space : Type u
  measure : Set (space → ℝ)
  invarianceProperty : Prop

end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
end HautevilleHouse

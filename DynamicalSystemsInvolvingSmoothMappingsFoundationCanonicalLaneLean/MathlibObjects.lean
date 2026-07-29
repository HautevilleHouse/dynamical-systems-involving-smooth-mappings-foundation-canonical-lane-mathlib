import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DynamicalSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  smoothStructure : Prop

structure AdmittedDynamicalObject where
  space : DynamicalSpace
  flowProperty : Prop
  invariantMeasureProperty : Prop
  conclusion : flowProperty

structure DynamicalEndgameState where
  object : AdmittedDynamicalObject

def DynamicalWitnessClosed (O : AdmittedDynamicalObject) : Prop :=
  O.flowProperty

end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
end HautevilleHouse

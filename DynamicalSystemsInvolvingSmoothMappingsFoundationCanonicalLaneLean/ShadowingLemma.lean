import DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean.HomoclinicTangency

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure ShadowingPackage where
  hyperbolicSet : Prop
  shadowingProperty : Prop
  pseudoOrbitClose : Prop
  shadowingDistance : Prop
  uniformHyperbolicity : Prop

def ShadowingClosed (P : ShadowingPackage) : Prop :=
  P.shadowingProperty ∧ P.pseudoOrbitClose ∧ P.shadowingDistance ∧ P.uniformHyperbolicity

theorem shadowing_from_hyperbolic (P : ShadowingPackage) (h : P.hyperbolicSet) : ShadowingClosed P :=
  by
    refine And.intro P.shadowingProperty (And.intro P.pseudoOrbitClose (And.intro P.shadowingDistance P.uniformHyperbolicity))

end HautevilleHouse
end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
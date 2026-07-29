import DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean.StableUnstableDecomposition

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure HomoclinicTangencyPackage where
  hyperbolicFixedPoint : Prop
  homoclinicPoint : Prop
  tangencyCondition : Prop
  genericCondition : Prop
  localBifurcation : Prop

def HomoclinicTangencyClosed (P : HomoclinicTangencyPackage) : Prop :=
  P.homoclinicPoint ∧ P.tangencyCondition ∧ P.genericCondition ∧ P.localBifurcation

theorem homoclinic_tangency_from_hyperbolic (P : HomoclinicTangencyPackage) (h : P.hyperbolicFixedPoint) : HomoclinicTangencyClosed P :=
  by
    refine And.intro P.homoclinicPoint (And.intro P.tangencyCondition (And.intro P.genericCondition P.localBifurcation))

end HautevilleHouse
end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
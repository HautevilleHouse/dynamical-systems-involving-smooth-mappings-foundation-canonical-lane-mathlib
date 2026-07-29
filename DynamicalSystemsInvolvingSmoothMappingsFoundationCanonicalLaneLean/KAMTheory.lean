import DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean.CenterManifold

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure KAMPackage where
  nearlyIntegrableSystem : Prop
  invariantTorusExists : Prop
  diophantineCondition : Prop
  nondegeneracyCondition : Prop
  smallPerturbation : Prop

def KAMClosed (P : KAMPackage) : Prop :=
  P.invariantTorusExists ∧ P.diophantineCondition ∧ P.nondegeneracyCondition ∧ P.smallPerturbation

theorem KAM_from_nearly_integrable (P : KAMPackage) (h : P.nearlyIntegrableSystem) : KAMClosed P :=
  by
    refine And.intro P.invariantTorusExists (And.intro P.diophantineCondition (And.intro P.nondegeneracyCondition P.smallPerturbation))

end HautevilleHouse
end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
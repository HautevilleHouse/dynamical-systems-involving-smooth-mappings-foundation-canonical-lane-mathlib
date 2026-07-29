import canonicalLaneMathlib.AdmissibleClass

/-!
# Tangent Bundle Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure TangentBundlePackage {M : MappingsFoundationPackage}
    (D : SmoothDynamicsPackage M) where
  tangentSpace : Type u
  pushforwardDefined : Prop
  vectorFieldSmooth : Prop
  lieBracketClosed : Prop

structure TangentBundleEvidence {M : MappingsFoundationPackage}
    {D : SmoothDynamicsPackage M} (T : TangentBundlePackage D) where
  pushforwardDefinedClosed : T.pushforwardDefined
  vectorFieldSmoothClosed : T.vectorFieldSmooth
  lieBracketClosedClosed : T.lieBracketClosed

def TangentBundleClosed {M : MappingsFoundationPackage}
    {D : SmoothDynamicsPackage M} (T : TangentBundlePackage D) : Prop :=
  T.pushforwardDefined ∧ T.vectorFieldSmooth ∧ T.lieBracketClosed

theorem tangent_bundle_closed_from_evidence {M : MappingsFoundationPackage}
    {D : SmoothDynamicsPackage M} (T : TangentBundlePackage D)
    (E : TangentBundleEvidence T) : TangentBundleClosed T := by
  exact And.intro E.pushforwardDefinedClosed
    (And.intro E.vectorFieldSmoothClosed E.lieBracketClosedClosed)

end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
end HautevilleHouse
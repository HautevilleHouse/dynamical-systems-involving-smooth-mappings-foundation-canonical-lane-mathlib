import DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean.DynamicalMapsCore

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let O : AdmissibleDynamicalObject := A.object
  O.invariantManifold

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

end HautevilleHouse
end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
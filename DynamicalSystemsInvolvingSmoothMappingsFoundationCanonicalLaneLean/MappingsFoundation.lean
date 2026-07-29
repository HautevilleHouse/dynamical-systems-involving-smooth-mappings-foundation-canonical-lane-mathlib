import canonicalLaneMathlib.AdmissibleClass

/-!
# Mappings Foundation Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure MappingsFoundationPackage where
  smoothMap : Type u → Type v
  compositionClosure : Prop
  inversePreserved : Prop
  identityIncluded : Prop

structure MappingsFoundationEvidence (M : MappingsFoundationPackage) where
  compositionClosureClosed : M.compositionClosure
  inversePreservedClosed : M.inversePreserved
  identityIncludedClosed : M.identityIncluded

def MappingsFoundationClosed (M : MappingsFoundationPackage) : Prop :=
  M.compositionClosure ∧ M.inversePreserved ∧ M.identityIncluded

theorem mappings_foundation_closed_from_evidence (M : MappingsFoundationPackage)
    (E : MappingsFoundationEvidence M) : MappingsFoundationClosed M := by
  exact And.intro E.compositionClosureClosed
    (And.intro E.inversePreservedClosed E.identityIncludedClosed)

end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
end HautevilleHouse
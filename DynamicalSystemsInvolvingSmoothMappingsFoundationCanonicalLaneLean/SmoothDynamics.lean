import canonicalLaneMathlib.AdmissibleClass

/-!
# Smooth Dynamics Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure SmoothDynamicsPackage (M : MappingsFoundationPackage) where
  flowMap : Prop
  invariantManifold : Prop
  orbitStructure : Prop
  stabilityProperty : Prop

structure SmoothDynamicsEvidence {M : MappingsFoundationPackage}
    (D : SmoothDynamicsPackage M) where
  flowMapClosed : D.flowMap
  invariantManifoldClosed : D.invariantManifold
  orbitStructureClosed : D.orbitStructure
  stabilityPropertyClosed : D.stabilityProperty

def SmoothDynamicsClosed {M : MappingsFoundationPackage}
    (D : SmoothDynamicsPackage M) : Prop :=
  D.flowMap ∧ D.invariantManifold ∧ D.orbitStructure ∧ D.stabilityProperty

theorem smooth_dynamics_closed_from_evidence {M : MappingsFoundationPackage}
    (D : SmoothDynamicsPackage M) (E : SmoothDynamicsEvidence D) :
    SmoothDynamicsClosed D := by
  exact And.intro E.flowMapClosed
    (And.intro E.invariantManifoldClosed
      (And.intro E.orbitStructureClosed E.stabilityPropertyClosed))

end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
end HautevilleHouse
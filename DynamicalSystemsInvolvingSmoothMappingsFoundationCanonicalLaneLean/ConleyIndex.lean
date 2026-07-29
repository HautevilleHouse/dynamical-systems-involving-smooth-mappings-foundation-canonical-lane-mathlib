import DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean.SmoothMappingFlow

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure ConleyIndexPackage {F : SmoothMappingFlowPackage} where
  isolatedInvariantSet : Set F.manifold
  isolatingNeighborhood : Set F.manifold
  isolatingNeighborhoodOpen : IsOpen isolatingNeighborhood
  invariantSetInNeighborhood : ∀ x : F.manifold, x ∈ isolatedInvariantSet → x ∈ isolatingNeighborhood
  forwardInvariant : ∀ x : F.manifold, x ∈ isolatingNeighborhood → ∀ t ≥ 0, F.flowMap t x ∈ isolatingNeighborhood
  exitSet : Set F.manifold
  exitSetOpenInBoundary : IsOpen (exitSet ∩ closure (isolatingNeighborhood \ isolatedInvariantSet))
  indexPair : Prop  -- homotopy index pair property

structure ConleyIndexEvidence {F : SmoothMappingFlowPackage} (C : ConleyIndexPackage F) where
  isolatingNeighborhoodOpenClosed : IsOpen C.isolatingNeighborhood
  forwardInvariantClosed : ∀ x : F.manifold, x ∈ C.isolatingNeighborhood → ∀ t ≥ 0, F.flowMap t x ∈ C.isolatingNeighborhood
  exitSetOpenInBoundaryClosed : IsOpen (C.exitSet ∩ closure (C.isolatingNeighborhood \ C.isolatedInvariantSet))
  indexPairClosed : C.indexPair

def ConleyIndexClosed {F : SmoothMappingFlowPackage} (C : ConleyIndexPackage F) : Prop :=
  IsOpen C.isolatingNeighborhood ∧
  (∀ x : F.manifold, x ∈ C.isolatingNeighborhood → ∀ t ≥ 0, F.flowMap t x ∈ C.isolatingNeighborhood) ∧
  IsOpen (C.exitSet ∩ closure (C.isolatingNeighborhood \ C.isolatedInvariantSet)) ∧
  C.indexPair

theorem conley_index_closed_from_evidence {F : SmoothMappingFlowPackage} (C : ConleyIndexPackage F) (E : ConleyIndexEvidence C) :
    ConleyIndexClosed C := by
  exact And.intro E.isolatingNeighborhoodOpenClosed (And.intro E.forwardInvariantClosed (And.intro E.exitSetOpenInBoundaryClosed E.indexPairClosed))

end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
end HautevilleHouse
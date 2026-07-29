import DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean.InvariantManifold

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure LyapunovFunctionPackage {F : SmoothMappingFlowPackage} where
  functionVal : F.manifold → ℝ
  smooth : SmoothAt (𝓘(ℝ, F.manifold)) 𝓘(ℝ, ℝ) functionVal
  nonincreasingAlongFlow : ∀ x : F.manifold, ∀ t1 t2 : F.timeDomain, t1 ≤ t2 → functionVal (F.flowMap t2 x) ≤ functionVal (F.flowMap t1 x)
  lowerBounded : ∃ M : ℝ, ∀ x : F.manifold, functionVal x ≥ M

structure LyapunovFunctionEvidence {F : SmoothMappingFlowPackage} (L : LyapunovFunctionPackage F) where
  smoothClosed : SmoothAt (𝓘(ℝ, F.manifold)) 𝓘(ℝ, ℝ) L.functionVal
  nonincreasingAlongFlowClosed : ∀ x : F.manifold, ∀ t1 t2 : F.timeDomain, t1 ≤ t2 → L.functionVal (F.flowMap t2 x) ≤ L.functionVal (F.flowMap t1 x)
  lowerBoundedClosed : ∃ M : ℝ, ∀ x : F.manifold, L.functionVal x ≥ M

def LyapunovFunctionClosed {F : SmoothMappingFlowPackage} (L : LyapunovFunctionPackage F) : Prop :=
  SmoothAt (𝓘(ℝ, F.manifold)) 𝓘(ℝ, ℝ) L.functionVal ∧
  (∀ x : F.manifold, ∀ t1 t2 : F.timeDomain, t1 ≤ t2 → L.functionVal (F.flowMap t2 x) ≤ L.functionVal (F.flowMap t1 x)) ∧
  (∃ M : ℝ, ∀ x : F.manifold, L.functionVal x ≥ M)

theorem lyapunov_function_closed_from_evidence {F : SmoothMappingFlowPackage} (L : LyapunovFunctionPackage F) (E : LyapunovFunctionEvidence F) :
    LyapunovFunctionClosed L := by
  exact And.intro E.smoothClosed (And.intro E.nonincreasingAlongFlowClosed E.lowerBoundedClosed)

end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
end HautevilleHouse
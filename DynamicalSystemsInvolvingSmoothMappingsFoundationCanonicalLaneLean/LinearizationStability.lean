import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean

structure LinearizationStabilityPackage where
  baseSystem : SmoothDynamicalSystemPackage
  equilibrium : baseSystem.stateSpace
  derivativeMap : baseSystem.stateSpace → (baseSystem.stateSpace →L[ℝ] baseSystem.stateSpace)
  spectrumControlled : Set ℂ
  stabilityCondition : Prop
  lyapunovFunction : baseSystem.stateSpace → ℝ
  lyapunovDerivativeNonPositive : Prop

structure LinearizationStabilityEvidence (L : LinearizationStabilityPackage) where
  derivativeAtEquilibrium : L.derivativeMap L.equilibrium = 0
  spectrumControlledClosed : (spectrum (L.derivativeMap L.equilibrium)).subset L.spectrumControlled
  lyapunovDerivativeNonPositiveClosed : L.lyapunovDerivativeNonPositive

def LinearizationStabilityClosed (L : LinearizationStabilityPackage) : Prop :=
  L.derivativeMap L.equilibrium = 0 ∧
  (spectrum (L.derivativeMap L.equilibrium)).subset L.spectrumControlled ∧
  L.lyapunovDerivativeNonPositive

theorem linearization_stability_closed_from_evidence (L : LinearizationStabilityPackage)
    (E : LinearizationStabilityEvidence L) : LinearizationStabilityClosed L := by
  exact And.intro E.derivativeAtEquilibrium (And.intro E.spectrumControlledClosed E.lyapunovDerivativeNonPositiveClosed)

end DynamicalSystemsInvolvingSmoothMappingsFoundationCanonicalLaneLean
end HautevilleHouse
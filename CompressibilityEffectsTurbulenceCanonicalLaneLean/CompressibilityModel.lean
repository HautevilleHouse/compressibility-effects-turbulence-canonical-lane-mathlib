import CompressibilityEffectsTurbulenceCanonicalLaneLean.MathlibPDESubstrate

namespace HautevilleHouse
namespace CompressibilityEffectsTurbulenceCanonicalLaneLean

structure CompressibleFlow where
  density : ScalarField
  velocity : VectorField
  energy : ScalarField
  viscosity : ℝ
  heatConductivity : ℝ

def defaultCompressibleFlow : CompressibleFlow := { density := zeroScalarField, velocity := zeroVectorField, energy := zeroScalarField, viscosity := 1, heatConductivity := 1 }

structure CompressibilityParameters where
  machNumber : ℝ
  reynoldsNumber : ℝ
  turbulentMachNumber : ℝ

def defaultCompressibilityParameters : CompressibilityParameters := { machNumber := 0.3, reynoldsNumber := 1e5, turbulentMachNumber := 0.1 }

end CompressibilityEffectsTurbulenceCanonicalLaneLean
end HautevilleHouse
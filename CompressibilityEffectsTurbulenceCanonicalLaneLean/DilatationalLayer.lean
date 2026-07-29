import CompressibilityEffectsTurbulenceCanonicalLaneLean.TurbulenceClosureLayer

namespace HautevilleHouse
namespace CompressibilityEffectsTurbulenceCanonicalLaneLean

structure DilatationalStatistics where
  dilatationRate : ℝ
  compressibilityFactor : ℝ
  dilatationalDissipation : ℝ
  solenoidalDissipation : ℝ

def defaultDilatationalStatistics : DilatationalStatistics := { dilatationRate := 0, compressibilityFactor := 0, dilatationalDissipation := 0, solenoidalDissipation := 1 }

structure DilatationalClosureCertificate where
  statistics : DilatationalStatistics
  modelConstantC1 : ℝ
  modelConstantC2 : ℝ
  positivity : modelConstantC1 > 0 ∧ modelConstantC2 > 0
  statisticsClosed : statistics.dilatationalDissipation ≥ 0 ∧ statistics.solenoidalDissipation ≥ 0

def defaultDilatationalClosureCertificate : DilatationalClosureCertificate := {
  statistics := defaultDilatationalStatistics
  modelConstantC1 := 1.0
  modelConstantC2 := 1.0
  positivity := by
    refine And.intro ?_ ?_
    · norm_num
    · norm_num
  statisticsClosed := by
    refine And.intro ?_ ?_
    · norm_num
    · norm_num
}

def DilatationalClosureClosed (C : DilatationalClosureCertificate) : Prop := C.statisticsClosed ∧ C.positivity

theorem default_dilatational_closure_closed : DilatationalClosureClosed defaultDilatationalClosureCertificate := by
  refine And.intro defaultDilatationalClosureCertificate.statisticsClosed defaultDilatationalClosureCertificate.positivity

end CompressibilityEffectsTurbulenceCanonicalLaneLean
end HautevilleHouse
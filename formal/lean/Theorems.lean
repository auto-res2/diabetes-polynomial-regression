import Values
import Claims
open Claims
/-! 各命題の判定。parse_claims.py が生成する。 -/
theorem R01_c1_holds : R01_c1 (observedSha256 := Values.observedSha256) (literatureSha256 := Values.literatureSha256) := by decide +kernel
theorem R01_c2_holds : R01_c2 (splitSeed := Values.splitSeed) (nTrain := Values.nTrain) (nTest := Values.nTest) := by decide +kernel
theorem R02_c1_holds : R02_c1 (outputKeys := Values.outputKeys) := by decide +kernel
theorem R03_c1_holds : R03_c1 (polyDegree := Values.polyDegree) (nPolyFeatures := Values.nPolyFeatures) := by decide +kernel
theorem R03_c2_holds : R03_c2 (fitSteps := Values.fitSteps) := by decide +kernel
theorem R05_c1_holds : R05_c1 (testMse := Values.testMse) := by decide +kernel
theorem R06_c1_fails : ¬ (R06_c1 (testMse := Values.testMse)) := R06_c1_not_of_ge Values.testMse (by decide +kernel)

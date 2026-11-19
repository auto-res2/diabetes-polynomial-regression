import Mathlib
/-! 引用した claims の公理。parse_claims.py が引用先から生成する。手で編集しない。 -/
namespace Ref1
-- https://github.com/auto-res2/diabetes-linear-regression-4 の commit f722f646081d4766682c58cf0847bceecfccd784
opaque literatureFileSha256 : String
opaque distributedFileSha256 : String
opaque nTrain : ℕ
opaque nTest : ℕ
opaque nSamples : ℕ
opaque splitSeed : ℕ
noncomputable opaque mean {n : ℕ} (y : Fin n → ℝ) : ℝ
noncomputable opaque mse {n : ℕ} (y ŷ : Fin n → ℝ) : ℝ
noncomputable opaque r2 {n : ℕ} (y ŷ : Fin n → ℝ) : ℝ
opaque testMse : ℚ
abbrev R01_c4 (literatureFileSha256 distributedFileSha256 : String) : Prop :=
  literatureFileSha256 = distributedFileSha256
abbrev R06_c1 (nTrain nTest nSamples : ℕ) : Prop := nTrain = 353 ∧ nTest = 89 ∧ nTrain + nTest = nSamples
abbrev R07_c2 (splitSeed : ℕ) : Prop := splitSeed = 0
abbrev R12_c1 : Prop := ∀ (n : ℕ) (y ŷ : Fin n → ℝ),
  mse y ŷ = (1 / (n : ℝ)) * ∑ i, (y i - ŷ i) ^ 2 ∧
  r2 y ŷ = 1 - (∑ i, (y i - ŷ i) ^ 2) / ∑ i, (y i - mean y) ^ 2
abbrev R13_c1 : Prop := ∀ (n : ℕ) (y : Fin n → ℝ), mean y = (1 / (n : ℝ)) * ∑ i, y i
abbrev R20_c1 (testMse : ℚ) : Prop := (round (testMse / 0.1) : ℚ) * 0.1 = 3424.3
axiom R01_c4_cited : R01_c4 literatureFileSha256 distributedFileSha256
axiom R06_c1_cited : R06_c1 nTrain nTest nSamples
axiom R07_c2_cited : R07_c2 splitSeed
axiom R12_c1_cited : R12_c1
axiom R13_c1_cited : R13_c1
axiom R20_c1_cited : R20_c1 testMse
end Ref1

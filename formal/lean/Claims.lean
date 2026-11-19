import Mathlib
import References
/-!
レポート 2 の各文の claims を、命題として書いたもの。
値はすべて引数で受ける。値を入れるのは parse_claims.py が生成する Theorems.lean。
引用した claims は References.lean（parse_claims.py が引用先から生成する）に公理として置かれる。
検証器が無い claims は、対象を opaque な定数として置き、公理として宣言する（末尾）。
-/
namespace Claims

/-! ## R01 -/
abbrev R01_c1 (observedSha256 literatureSha256 : String) : Prop := observedSha256 = literatureSha256
abbrev R01_c2 (splitSeed nTrain nTest : ℕ) : Prop := splitSeed = 0 ∧ nTrain = 353 ∧ nTest = 89

/-! ## R02 -/
abbrev R02_c1 (outputKeys : List String) : Prop := "testMse" ∈ outputKeys

/-! ## R03 -/
abbrev R03_c1 (polyDegree nPolyFeatures : ℕ) : Prop := polyDegree = 2 ∧ nPolyFeatures = 65
abbrev R03_c2 (fitSteps : List String) : Prop :=
  fitSteps = ["sklearn.preprocessing.PolynomialFeatures", "sklearn.linear_model.LinearRegression"]

/-! ## R04 -/
/-- 検証器なし。正則化の係数は 0 である。 -/
abbrev R04_c1 (penaltyWeight : ℚ) : Prop := penaltyWeight = 0

/-! ## R05 -/
abbrev R05_c1 (testMse : ℚ) : Prop := (round (testMse / 0.1) : ℚ) * 0.1 = 3637.1

/-! ## R06 -/
/-- 文献 [1] の線形回帰のテストの MSE（Ref1.testMse）より小さい。 -/
abbrev R06_c1 (testMse : ℚ) : Prop := testMse < Ref1.testMse

/-- 引用した [1, R20] の c1 から、Ref1.testMse は 3424.25 以上 3424.35 以下。 -/
theorem ref1_testMse_bounds : 3424.25 ≤ Ref1.testMse ∧ Ref1.testMse ≤ 3424.35 := by
  have h := Ref1.R20_c1_cited
  have hr : (round (Ref1.testMse / 0.1) : ℚ) = 34243 := by linarith
  have ha := abs_sub_round (Ref1.testMse / 0.1)
  rw [hr] at ha
  rw [abs_le] at ha
  norm_num at ha
  constructor <;> linarith [ha.1, ha.2]

theorem R06_c1_of_lt (testMse : ℚ) (h : testMse < 3424.25) : R06_c1 testMse :=
  lt_of_lt_of_le h ref1_testMse_bounds.1

theorem R06_c1_not_of_ge (testMse : ℚ) (h : 3424.35 ≤ testMse) : ¬ R06_c1 testMse :=
  not_lt.mpr (le_trans ref1_testMse_bounds.2 h)

/-! ## 検証器が無い claims の公理 -/
namespace Unobserved
opaque penaltyWeight : ℚ
end Unobserved

axiom R04_c1_axiom : R04_c1 Unobserved.penaltyWeight

end Claims

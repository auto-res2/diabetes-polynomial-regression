import Mathlib
/-! 検証器が返した値と、宣言した値。parse_claims.py が生成する。手で編集しない。 -/
namespace Values
def observedSha256 : String := "4733febee697862c22139cdac87478a300ce0d101593deb07ed6c0f3328a99cd"
def literatureSha256 : String := "4733febee697862c22139cdac87478a300ce0d101593deb07ed6c0f3328a99cd"
def splitSeed : ℕ := 0
def nTrain : ℕ := 353
def nTest : ℕ := 89
def outputKeys : List String := ["nSamples", "nFeatures", "featureColumns", "targetColumn", "splitSeed", "nTrain", "nTest", "trainIndex", "testIndex", "loadedXSha256", "modelInputXSha256", "usedFeatureCount", "fitSteps", "polyDegree", "nPolyFeatures", "targetMean", "targetStd", "trainMse", "trainRmse", "trainMae", "trainR2", "testMse", "testRmse", "testMae", "testR2", "meanPredictorTestRmse", "envCpuModel", "envCpuLogicalCores", "envMemoryGib", "envPython", "envNumpy", "envScikitLearn"]
def polyDegree : ℕ := 2
def nPolyFeatures : ℕ := 65
def fitSteps : List String := ["sklearn.preprocessing.PolynomialFeatures", "sklearn.linear_model.LinearRegression"]
def testMse : ℚ := ((90928666845181 : ℚ) / 25000000000)
def trainMse : ℚ := ((11280284839036233 : ℚ) / 5000000000000)
def trainRmse : ℚ := ((4749796803871979 : ℚ) / 100000000000000)
def trainMae : ℚ := ((3800780470289343 : ℚ) / 100000000000000)
def trainR2 : ℚ := ((49375506710467 : ℚ) / 78125000000000)
def testRmse : ℚ := ((12061752233912351 : ℚ) / 200000000000000)
def testMae : ℚ := ((9281292593314383 : ℚ) / 200000000000000)
def testR2 : ℚ := ((1816987092270219 : ℚ) / 6250000000000000)
end Values

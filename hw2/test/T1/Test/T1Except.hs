{-# LANGUAGE StandaloneDeriving #-}

module Test.T1Except
  where
import HW2.T1 (Except (Error, Success), mapExcept)
import Hedgehog
import qualified Hedgehog.Gen as Gen
import Test.Common
import Test.Hspec
import Test.Tasty
import Test.Tasty.Hedgehog
import Test.Tasty.Hspec

deriving instance ((Show a, Show b)) => Show (Except a b)
deriving instance ((Eq a, Eq b)) => Eq (Except a b)

hspecExcept :: IO TestTree
hspecExcept = testSpec "Except tests:" $ do
    describe "Error tests:" $ do
        it "Error test" $ mapExcept (+ 1) (Error "bad news") `shouldBe` Error "bad news"
        it "Error(f . g) test" $ (mapExcept (+ 1) . mapExcept (* 10)) (Error "bad news") `shouldBe` Error "bad news"
    describe "Success tests:" $ do
        let m = Success 1 :: Except String Int
        it "Success test" $ mapExcept (+ 1) m `shouldBe` Success 2
        it "Success(f . g) test" $ (mapExcept (+ 1) . mapExcept (* 10)) m `shouldBe` Success 11

genExcept :: Gen (Except Int Int)
genExcept = Gen.choice [genError, genSuccess]
  where
    genError = Error <$> genInt
    genSuccess = Success <$> genInt

propExcept :: TestTree
propExcept = allProps "Except" genExcept mapExcept

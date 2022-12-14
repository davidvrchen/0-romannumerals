{-|
Copyright   : Matt Verhoeven (1728342)
              David Chen (1742477)

-}

import Test.Hspec
import Control.Exception (evaluate)
import Test.QuickCheck
import RomanNumbers (r2i, i2r)

-- A QuickCheck generator for natural number between 1 and 10000.
naturals :: Gen Int
naturals = choose (1, 10000)

main :: IO ()
main = hspec $ do
  describe "RomanNumbers" $ do
    describe "r2i" $ do

    -- Here go your own tests for r2i.

      it "should convert \"I\" to 1" $ do
        r2i "I" `shouldBe` (1::Int)
      it "should convert \"V\" to 5" $ do
        r2i "V" `shouldBe` (5::Int)
      it "should convert \"LXX\" to 70" $ do
        r2i "LXX" `shouldBe` (70::Int)
      it "should convert \"MCMIX\" to 2111" $ do
        r2i "MCMIX" `shouldBe` (2111::Int)
      it "should convert \"MDCLXVI\" to 1666" $ do
        r2i "MDCLXVI" `shouldBe` (1666 ::Int)
      it "should return an error when not a valid Roman number" $ do
        evaluate (r2i "Javascript") `shouldThrow` anyErrorCall

  
    describe "i2r" $ do
      
      -- Here go your own tests for i2r.
      
      it "should convert 1 to \"I\"" $ do
        i2r (1::Int) `shouldBe` "I"
      it "should convert 16 to \"XVI\"" $ do
        i2r (16::Int) `shouldBe` "XVI"
      it "should convert 5 to \"V\"" $ do
        i2r (5::Int) `shouldBe` "V"
      it "should convert 70 to \"LXX\"" $ do
        i2r (70::Int) `shouldBe` "LXX"
      it "should convert 1234 to \"MCCXXXIIII\"" $ do
        i2r (1234::Int) `shouldBe` "MCCXXXIIII"
      it "should convert 1666 to \"MDCLXVI\"" $ do
        i2r (1666::Int) `shouldBe` "MDCLXVI"
      it "should convert 0 to \"\"" $ do
        i2r (0::Int) `shouldBe` ""
      it "should return an error if given a negative number" $ do
        evaluate (i2r (-1 ::Int)) `shouldThrow` anyErrorCall 
            

-- Do not change anything below this line
--
    describe "r2i . i2r" $ do

      -- Here go your own tests for r2i . i2r.

      it "(forall n : n in N : (r2i . i2r) n >= 1)" $ property $
        forAll naturals (\n -> (r2i . i2r) n >= (1::Int))
      it "(forall n : n in N : (r2i . i2r) n == n)" $ property $
        forAll naturals (\n -> (r2i . i2r) n == n)
      it "should convert 0 to 0" $ do
        (r2i . i2r) (0::Int) `shouldBe` (0::Int) 
      it "should convert 123 to 123" $ do
        (r2i . i2r) (123::Int) `shouldBe` (123::Int) 

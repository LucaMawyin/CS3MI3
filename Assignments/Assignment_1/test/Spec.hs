
module Main where

import Arith
import Esses
import Test.QuickCheck

-- Generate random ArithTerms
genArithTerm :: Int -> Gen ArithTerm
genArithTerm 0 =
    elements [TmTrue, TmFalse, TmZero]

genArithTerm n =
    frequency
        [ (3, elements [TmTrue, TmFalse, TmZero])
        , (2, TmSucc <$> genArithTerm (n - 1))
        , (2, TmPred <$> genArithTerm (n - 1))
        , (2, TmIsZero <$> genArithTerm (n - 1))
        , (3, TmIfThenElse
                <$> genArithTerm (n - 1)
                <*> genArithTerm (n - 1)
                <*> genArithTerm (n - 1))
        ]

-- Count nodes in AST
termSize :: ArithTerm -> Int
termSize TmTrue = 1
termSize TmFalse = 1
termSize TmZero = 1
termSize (TmSucc t) = 1 + termSize t
termSize (TmPred t) = 1 + termSize t
termSize (TmIsZero t) = 1 + termSize t
termSize (TmIfThenElse t1 t2 t3) =
    1 + termSize t1 + termSize t2 + termSize t3

-- Check esses on random terms
prop_essesBoundedByTermSize :: Property
prop_essesBoundedByTermSize =
    forAll (resize 50 (sized genArithTerm)) $ \t ->
        esses t <= termSize t

main :: IO ()
main = do

    putStrLn "Testing esses bounded by term size:"
    quickCheck (withMaxSuccess 100 prop_essesBoundedByTermSize)

    putStrLn "All tests finished."

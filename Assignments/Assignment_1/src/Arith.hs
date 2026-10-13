module Arith where

data ArithTerm
    = TmTrue
    | TmFalse
    | TmZero
    | TmSucc ArithTerm
    | TmPred ArithTerm
    | TmIsZero ArithTerm
    | TmIfThenElse ArithTerm ArithTerm ArithTerm
    deriving (Show, Eq)
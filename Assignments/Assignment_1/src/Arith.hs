module Assignments.Assignment_1.Arith where

data ArithTerm
    = TmTrue
    | TmFalse
    | TmZero
    | TmSucc ArithTerm
    | TmPred ArithTerm
    | TmIsZero ArithTerm
    | TmIf ArithTerm ArithTerm ArithTerm
    deriving (Show, Eq)
module Esses where

import Arith

esses :: ArithTerm -> Int
esses TmTrue = 0
esses TmFalse = 1
esses TmZero = 0
esses (TmSucc t) = 1 + esses t
esses (TmPred t) = esses t
esses (TmIsZero t) = 1 + esses t
esses (TmIfThenElse t0 t1 t2) = 1 + esses t0 + esses t1 + esses t2
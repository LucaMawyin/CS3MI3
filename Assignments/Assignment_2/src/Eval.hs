module Eval where

import R

------------------------------
-- evalOne
------------------------------

evalOne :: RTerm -> Maybe RTerm

-- Eval true/false does nothing
evalOne RTrue = Nothing
evalOne RFalse = Nothing

-- Eval with if true/false
evalOne (If RTrue t) = Just t
evalOne (If RFalse t) = Just RTrue

-- Eval t0 and decide what to return
evalOne (If t0 t1) = 
    case evalOne t0 of
        Just t0' -> Just (If t0' t1)
        Nothing -> Nothing

------------------------------
-- evalBig
------------------------------

evalBig :: RTerm -> RTerm 
evalBig t = maybe t evalBig (evalOne t)
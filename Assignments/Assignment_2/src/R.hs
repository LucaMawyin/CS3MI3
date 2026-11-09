module R where

data RTerm
    = RTrue 
    | RFalse
    | If RTerm RTerm
    deriving (Show, Eq)
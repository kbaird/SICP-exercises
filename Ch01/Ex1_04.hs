{-
 - Ex1_04.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - Demonstrate an operator that is a compound expression
 - (i.e., not known at compile time).
 -}

aPlusAbsB :: Int -> Int -> Int
aPlusAbsB a b = a `op` b
  where
    op
      | b > 0     = (+)
      | otherwise = (-)

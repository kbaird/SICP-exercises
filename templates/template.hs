{-
 - ExX_X.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 -}

aPlusAbsB :: Int -> Int -> Int
aPlusAbsB a b = a `op` b
  where
    op
      | b > 0     = (+)
      | otherwise = (-)

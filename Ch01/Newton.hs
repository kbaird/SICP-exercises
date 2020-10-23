{-
 - Newton.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - Calculate square roots using Newton's Method
 - (Example 1.1.7)
 -
 -}

module Newton where

import Newton.Internal

sqrt :: Float -> Float
sqrt = sqrtIter 1.0


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

sqrt :: Float -> Float
sqrt = sqrtIter 1.0

improve :: Float -> Float -> Float
improve guess x = (guess + (x/guess)) / 2.0

goodEnough :: Float -> Float -> Bool
goodEnough guess x = 
  (abs ((square guess) - x)) < tolerance

square :: Float -> Float
square x = x * x

sqrtIter :: Float -> Float -> Float
sqrtIter guess x
  | goodEnough guess x = guess
  | otherwise          = sqrtIter (improve guess x) x

tolerance :: Float
tolerance = 0.001

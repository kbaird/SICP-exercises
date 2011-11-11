{-
 - Ex1_07.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - Redefine the tolerance to be a certain fraction 
 - of the guess, rather than a constant value.
 -}

module NewtonSquare where

sqrt :: Float -> Float
sqrt = sqrtIter 1.0

improve :: Float -> Float -> Float
improve guess x = (guess + (x/guess)) / 2.0

goodEnough :: Float -> Float -> Bool
goodEnough guess x = 
  (abs ((square guess) - x)) < tolerance guess

square :: Float -> Float
square x = x * x

sqrtIter :: Float -> Float -> Float
sqrtIter guess x
  | goodEnough guess x = guess
  | otherwise          = sqrtIter (improve guess x) x

tolerance :: Float -> Float
tolerance = (*) 0.001

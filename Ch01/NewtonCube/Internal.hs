{-
 - Ex1_08.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - Calculate cube roots using Newton's Method
 - (Exercise 1.8)
 -
 -}

module NewtonCube.Internal where

improve :: Float -> Float -> Float
improve guess x = (x / (square guess) + (2 * guess)) / 3.0

goodEnough :: Float -> Float -> Bool
goodEnough guess x =
  (abs ((cube guess) - x)) < tolerance

square :: Float -> Float
square x = x * x

cube :: Float -> Float
cube x = x * x * x

cbrtIter :: Float -> Float -> Float
cbrtIter guess x
  | goodEnough guess x = guess
  | otherwise          = cbrtIter (improve guess x) x

tolerance :: Float
tolerance = 0.001

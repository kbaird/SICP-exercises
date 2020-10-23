{-
 - Ex1_08.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - Calculate cube roots using Newton's Method
 - (Exercise 1.8)
 -
 -}

module NewtonCube where

import NewtonCube.Internal

cbrt :: Float -> Float
cbrt = cbrtIter 1.0

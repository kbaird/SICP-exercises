{-
 - Ex1_09.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - Define both a recursive and interative process for addition
 - (Exercise 1.9)
 -
 -}

module Ex1_9 where

inc :: Int -> Int
inc x = x + 1

dec :: Int -> Int
dec x = x - 1

recursiveAdd :: Int -> Int -> Int
recursiveAdd a b
  | a == 0    = b
  | otherwise = inc (recursiveAdd (dec a) b)

iterativeAdd :: Int -> Int -> Int
iterativeAdd a b
  | a == 0    = b
  | otherwise = iterativeAdd (dec a) (inc b)


{-
 - Ex1_12.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - Output Pascal's Triangle via a recursive process
 - (Exercise 1.12)
 -
 -}

module Ex1_12 where

pascalsTriangle :: Int -> [Int]
pascalsTriangle rowNum
  | rowNum == 0 = []
  | rowNum == 1 = [1]
  | rowNum == 2 = [1,1]
  | otherwise   = [1] ++ prevSums ++ [1]
  where
    prevRow  = pascalsTriangle (rowNum-1)
    prevSums = sumPairs prevRow

sumPairs :: [Int] -> [Int]
sumPairs []       = []
sumPairs [n]      = [n]
sumPairs [x, y]   = [x+y]
sumPairs (x:y:zs) = (x+y) : sumPairs (y:zs)


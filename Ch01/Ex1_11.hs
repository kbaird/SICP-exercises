{-
 - Ex1_11.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - Define both recursive and iterative processes for f
 - (Exercise 1.11)
 -
 -}

module Ex1_11 where

fRec :: Int -> Int
fRec n
  | n < 3     = n
  | otherwise = (fRec (n-1)) +
    (fRec (n-2) * 2) +
    (fRec (n-3) * 3)

fIter :: Int -> Int
fIter n = fIter2 n 0

fIter2 :: Int -> Int -> Int
fIter2 n total
  | n < 3     = n + total
  | otherwise = (fIter2 (n-1) total) +
    ((fIter2 (n-2) total) * 2) +
    ((fIter2 (n-3) total) * 3)


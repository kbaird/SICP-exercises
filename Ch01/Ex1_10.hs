{-
 - Ex1_10.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - Ackermann function
 - (Exercise 1.10)
 -
 -}

module Ex1_10 where

ackermann x y
  | y == 0 = 0
  | x == 0 = y * 2
  | y == 1 = 2
  | otherwise = ackermann (x-1) (ackermann x (y-1))

f   = ackermann 0 -- x * 2
g   = ackermann 1 -- 2 ** x if x > 0; 0 if x == 0; error if x < 0
h   = ackermann 2 -- [0 2 4 16 65536] read at index x if 0 <= x <= 4; error otherwise
k n = 5 * n * n     -- 5 n squared


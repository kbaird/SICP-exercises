{-
 - Ex1_05.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - Test applicative-order ("evaluate args and then apply")
 - vs.
 - normal-order ("fully expand and then reduce")
 - evaluation.
 -
 - The closest equivalent in Haskell is probably lazy evaluation.
 -}

ones :: [Int]
ones = 1 : ones

testOrder :: Int -> [Int] -> Int
testOrder x y
  | x == 0    = 0
  | otherwise = sum y

{-
 - Evaluating "testOrder 0 ones" in hugs will correctly
 - return 0, while any other x argument value will force an
 - attempted evaluation of the inifinite stream ('ones').
 -
 -}

{-
 - Ex1_03.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - Write a function that takes 3 numbers as arguments and returns
 - the sum of the squares of the 2largest arguments.
 -}

square :: Int -> Int
square x = x * x

sumSquares2Largest :: Int -> Int -> Int -> Int
sumSquares2Largest a b c = sums - lowestSquare
  where
    argsL        = [a, b, c]
    lowest       = minimum argsL
    lowestSquare = square lowest
    squaresL     = map square argsL
    sums         = foldr (+) 0 squaresL

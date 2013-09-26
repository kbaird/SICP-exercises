{-
 - Ex2_06.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - Church Numerals
 -
 -}

zero = \f -> (\x -> x)
add1 = \n -> (\x -> ())
one  = \f -> (\x -> (f x))
two  = \f -> (\x -> (f (f x)))

churchEncode n =
  \f -> (\x -> innerEncode f n x)
  where
    innerEncode f n x
      | n == 0    = x
      | otherwise = f (innerEncode f (n-1) x)


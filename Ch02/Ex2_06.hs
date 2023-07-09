{-
 - Ex2_06.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - Church Numerals
 -
 -}

zero   = const id
add1 n = const ()
one    = id
two f  = f . f

churchEncode n =
  (`innerEncode` n)
  where
    innerEncode f n x
      | n == 0    = x
      | otherwise = f (innerEncode f (n-1) x)


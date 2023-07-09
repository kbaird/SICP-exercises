{-
 - Ex2_05.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - Represent pair (a,b) as 2 ** a * 3 ** b
 -
 -}

cons :: Integral a => a -> a -> a
cons x y = 2 ^ x * 3 ^ y

car :: Integral a => a -> a
car z = innerCar z 0
  where
    innerCar a b
      | even a    = innerCar (div a 2) (b + 1)
      | otherwise = b

cdr :: Integral a => a -> a
cdr z = innerCdr z 0
  where
    innerCdr a b
      | mod a 3 == 0 = innerCdr (div a 3) (b + 1)
      | otherwise    = b


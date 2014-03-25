{-
 - Ex2_07-9.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - Exercise 2.7 - Interval Arithmetic
 - Exercise 2.8 - Add subInterval
 - Exercise 2.9 - Add widthInterval
 -
 -}

module Ex2_07 where

newtype Interval = MakeInterval (Float, Float)

toInterval :: (Float, Float) -> Interval
toInterval (x, y) = MakeInterval (x, y)

fromInterval :: Interval -> (Float, Float)
fromInterval (MakeInterval (x, y)) = (x, y)

startInterval :: Interval -> Float
startInterval i = start
  where (start, _) = fromInterval i

endInterval :: Interval -> Float
endInterval i = end
  where (_, end)   = fromInterval i

addInterval :: Interval -> Interval -> Interval
addInterval i1 i2 = toInterval (newS, newE)
  where
    newS = startInterval i1 + startInterval i2
    newE = endInterval   i1 + endInterval   i2

divInterval :: Interval -> Interval -> Interval
divInterval i1 i2 = multInterval i1 recipInterval
  where
    newS = (1.0 / startInterval i2)
    newE = (1.0 / endInterval i2)
    recipInterval = toInterval (newS, newE)

multInterval i1 i2 = toInterval (newS, newE)
  where
    newS     = minimum products
    newE     = maximum products
    products = [s1 * s2, s1 * e2, e1 * s2, e1 * e2]
    s1       = startInterval i1
    s2       = startInterval i2
    e1       = endInterval i1
    e2       = endInterval i2

subInterval :: Interval -> Interval -> Interval
subInterval i1 i2 = toInterval (newS, newE)
  where
    newS = startInterval i1 - startInterval i2
    newE = endInterval   i1 - endInterval   i2

widthInterval :: Interval -> Float
widthInterval i = endInterval i - startInterval i

{-
 - Ex2_04.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - cons, car, cdr
 -
 -}

{- FIXME type errors -}
cons x y = \m -> m x y
car z    = z (\(p,q) -> p)
cdr z    = z (\(p,q) -> q)

{-
 - Ex2_04.hs
 - Kevin C. Baird
 - SICP in Haskell
 -
 - cons, car, cdr
 -
 -}

type E = Int
type PairToE = E -> E  -> E
type Storage = PairToE -> E

cons :: E -> E -> Storage
cons x y f = f x y

car :: Storage -> E
car f = f const

cdr :: Storage -> E
cdr f = f (\x y -> y)


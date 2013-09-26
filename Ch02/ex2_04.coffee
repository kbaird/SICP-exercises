###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 2.4 - cons, car, cdr
###

cons = (x, y) -> ((m) -> m(x, y))
car  = (z) -> z ((p, q) -> p)
cdr  = (z) -> z ((p, q) -> q)

l = cons 1, 2
console.log car l
console.log cdr l

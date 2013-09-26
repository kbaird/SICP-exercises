###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 2.5 - Represent pair (a,b) as 2 ** a * 3 ** b
###

cons = (a, b) -> Math.pow(2, a) * Math.pow(3, b)

car = (z) ->
  innerCar = (a, b) ->
    return b unless (a % 2 is 0)
    innerCar (a / 2), (b + 1)
  innerCar z, 0

cdr = (z) ->
  innerCar = (a, b) ->
    return b unless (a % 3 is 0)
    innerCar (a / 3), (b + 1)
  innerCar z, 0

l = cons 1, 2
console.log car l
console.log cdr l

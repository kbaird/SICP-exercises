###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 2.5 - Represent pair (a,b) as 2 ** a * 3 ** b
###

EXPONENT = {car: 2, cdr: 3}

cons = (a, b) -> Math.pow(EXPONENT.car, a) * Math.pow(EXPONENT.cdr, b)

car = (z) ->
  innerCar = makeExptExtractor EXPONENT.car
  # replaces:
  #innerCar = (a, b) ->
  #  return b unless (a % 2 is 0)
  #  innerCar (a / 2), (b + 1)
  innerCar z, 0

cdr = (z) ->
  innerCar = makeExptExtractor EXPONENT.cdr
  # replaces:
  #innerCar = (a, b) ->
  #  return b unless (a % 3 is 0)
  #  innerCar (a / 3), (b + 1)
  innerCar z, 0

makeExptExtractor = (base) ->
  innerCar = (a, b) ->
    return b unless (a % base is 0)
    innerCar (a / base), (b + 1)

l = cons 1, 2
console.log car l
console.log cdr l

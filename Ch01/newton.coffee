###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 1.1.7 - Calculate square roots using Newton's method.
###

TOLERANCE = 0.001

sqrt = (x) ->
  average     = (x, y)      -> (x + y) / 2.0
  square      = (x)         -> x * x
  goodEnough  = (guess, x)  -> Math.abs(square(guess) - x) < TOLERANCE
  improve     = (guess, x)  -> average(guess, x/guess)
  innerSqrt   = (guess, x)  ->
    return guess if goodEnough(guess, x)
    innerSqrt(improve(guess, x), x)
  innerSqrt(1.0, x)

console.log sqrt 2


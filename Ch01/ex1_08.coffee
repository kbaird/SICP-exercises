###
Kevin C. Baird
SICP in CoffeeScript:
    Calculate cube roots using Newton's method.
###

cbrt = (x) ->
  TOLERANCE   = 0.001
  square      = (x)        -> x * x
  cube        = (x)        -> x * x * x
  goodEnough  = (guess, x) -> Math.abs(cube(guess) - x) < TOLERANCE
  improve     = (guess, x) -> (x / (square(guess)) + (2.0 * guess)) / 3.0
  innerCbrt   = (guess, x) ->
    return guess if goodEnough(guess, x)
    innerCbrt(improve(guess, x), x)
  innerCbrt(1.0, x)

console.log cbrt 2

###
Kevin C. Baird
SICP in CoffeeScript:
    Redefine tolerance to vary based on the guess,
    rather than being a constant value.
###

sqrt = (x) ->
  average     = (x, y)     -> (x + y) / 2.0
  square      = (x)        -> x * x
  tolerance   = (x)        -> x * 0.001
  goodEnough  = (guess, x) -> Math.abs(square(guess) - x) < tolerance(x)
  improve     = (guess, x) -> average(guess, x/guess)
  innerSqrt   = (guess, x) ->
    return guess if goodEnough(guess, x)
    innerSqrt(improve(guess, x), x)
  innerSqrt(1.0, x)

console.log sqrt 2

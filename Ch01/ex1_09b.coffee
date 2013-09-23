###
Kevin C. Baird
SICP in CoffeeScript:
    Add two positive integers, part II
###

add = (a, b) ->
  inc = (x) -> x + 1
  dec = (x) -> x - 1
  return b if a is 0
  add(dec(a), inc(b))

console.log add(4,5)

###
    Follow the substitution model for add(4, 5)

    add(4, 5)
    add(dec(4), inc(5))
    add(3, 6)
    add(dec(3), inc(6))
    add(2, 7)
    add(dec(2), inc(7))
    add(1, 8)
    add(dec(1), inc(8))
    add(0, 9)
    9

9, via an iterative process
###


###
Kevin C. Baird
SICP in CoffeeScript:
    Add two positive integers, part I
###

add = (a, b) ->
  inc = (x) -> x + 1
  dec = (x) -> x - 1
  return b if a is 0
  inc(add(dec(a), b))

console.log add(4, 5)

###
    Follow the substitution model for add(4, 5)

    add(4, 5)
    inc(add(dec(4), 5))
    inc(add(3, 5))
    inc(inc(add(dec(3), 5)))
    inc(inc(add(2, 5)))
    inc(inc(inc(inc(add(dec(1), 5)))))
    inc(inc(inc(inc(add(0, 5)))))
    inc(inc(inc(inc(5))))
    inc(inc(inc(6)))
    inc(inc(7))
    inc(8)
    9

9, via a recursive process
###

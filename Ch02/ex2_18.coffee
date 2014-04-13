###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 2.18 - reverse
###

reverse = (list) ->
  [head, tail...] = list
  if tail.length is 0 then [head] else reverse(tail).concat head

console.log reverse [0, 1, 2, 3]

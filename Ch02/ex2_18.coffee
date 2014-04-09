###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 2.18 - reverse
###

reverse = (l) ->
  head = l[0]
  tail = l[1..]
  if tail.length is 0 then [head] else reverse(tail).concat head

# TODO: does not include starting 3 for some reason
console.log reverse [0, 1, 2, 3]

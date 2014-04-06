###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 2.17 - lastPair
###

lastPair = (l) ->
  if l.length is 1 then l else lastPair (l[1..])

console.log lastPair [0, 1, 2, 3]

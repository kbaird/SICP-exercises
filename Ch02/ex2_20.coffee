###
Kevin C. Baird
SICP in CoffeeScript:
  Exercise 2.20 - same-parity filter
###

sameParity = (list) ->
  [model, others...] = list
  evenP = (x) -> x % 2 is 0
  oddP  = (x) -> x % 2 is 1
  p     = if evenP(model) then evenP else oddP
  [model].concat(x for x in others when p(x))

console.log sameParity  [0, 1, 2, 3, 4]
console.log sameParity  [1, 2, 3, 4, 5]


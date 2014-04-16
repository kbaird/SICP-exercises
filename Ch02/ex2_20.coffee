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

sameParity2 = (list) ->
  evenP = (x) -> x % 2 is 0
  oddP  = (x) -> x % 2 is 1
  p     = if evenP(list[0]) then evenP else oddP
  list.filter(p)

console.log sameParity  [0, 1, 2, 3, 4]
console.log sameParity  [1, 2, 3, 4, 5]
console.log sameParity2 [0, 1, 2, 3, 4]
console.log sameParity2 [1, 2, 3, 4, 5]



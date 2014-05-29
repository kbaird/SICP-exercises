###
Kevin C. Baird
SICP in CoffeeScript:
 Exercise 2.32 - set of all subsets
###

subSets = (set) ->
  powerSets = (x) ->
    [headS, tailS...] = set
    [headS].concat(x)
  if set is [] then [] else
    [head, tail...] = set
    [tail].concat(powerSets(x) for x in tail)

set = [1, 2, 3]

console.log subSets(set)

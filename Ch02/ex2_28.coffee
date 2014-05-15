###
Kevin C. Baird
SICP in CoffeeScript:
  Exercise 2.28 - fringe
###

x = [[1, 2], [3, 4]]
y = [x, x]

fringe = (items) ->
  if items.length is 0 then [] else
    [head, tail...] = items
    [].concat(head...).concat fringe(tail)

console.log(fringe(x)) # want [1, 2, 3, 4]
console.log(fringe(y)) # want [1, 2, 3, 4, 1, 2, 3, 4]

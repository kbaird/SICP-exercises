###
Kevin C. Baird
SICP in CoffeeScript:
  Exercise 2.21 - Define 2 versions of square-list
###

squareList1 = (items) ->
  if items.length is 0 then [] else
    [head, tail...] = items
    [((x) -> x * x)(head)].concat squareList1 tail

squareList2 = (items) ->
  items.map (x) -> x * x

console.log squareList1 [0, 1, 2, 3, 4]
console.log squareList2 [0, 1, 2, 3, 4]



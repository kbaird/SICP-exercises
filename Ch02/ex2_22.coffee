###
Kevin C. Baird
SICP in CoffeeScript:
  Exercise 2.22 - Make square-list iterative
###

reverse = (list) ->
  if list.length is 0 then [] else
    [head, tail...] = list
    if tail.length is 0 then [head] else reverse(tail).concat head

squareListIter = (items) ->
  square = (x) -> x * x
  iter   = (items, answer) ->
    if items.length is 0 then answer else
      [head, tail...] = items
      iter(tail, [square(head)].concat answer)
  reverse(iter(items, []))

console.log squareListIter []
console.log squareListIter [0, 1, 2, 3, 4]

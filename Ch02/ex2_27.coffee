###
Kevin C. Baird
SICP in CoffeeScript:
  Exercise 2.27 - deep reverse
###

x = [1, 2, 3]
y = [4, 5, 6, x]

deepReverse = (items) ->
  if items.length is 0 then [] else
    [head, tail...] = items
    coda = if head.length is 2 then deepReverse(head) else [head]
    deepReverse(tail).concat(coda)

console.log(deepReverse(x))
console.log(deepReverse(y))

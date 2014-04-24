###
Kevin C. Baird
SICP in CoffeeScript:
  Exercise 2.23 - forEach
###

forEach = (f, items) ->
  if items.length is 0 then true else
    [head, tail...] = items
    f(head)
    forEach(f, tail)

f = (x) -> console.log(x)
forEach(f, [57, 321, 88])

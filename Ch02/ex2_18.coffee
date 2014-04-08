###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 2.18 - reverse
###

reverse = (l) ->
  # flatten taken from http://coffeescript.org/documentation/docs/helpers.html
  flatten = (array) ->
    flattened = []
    for element in array
      if element instanceof Array
        flattened = flattened.concat flatten element
      else
        flattened.push element
    flattened

  innerReverse = (l) ->
    head = l[0]
    tail = l[1..]
    if tail.length is 0 then head else [reverse(tail), head]

  flatten innerReverse l

# TODO: does not include starting 3 for some reason
console.log reverse [0, 1, 2, 3]

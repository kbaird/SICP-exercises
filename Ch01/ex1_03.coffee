###
Kevin C. Baird
SICP in CoffeeScript:
  Write a function that takes 3 arguments and returns
  the sum of the squares of the 2 largest arguments.
###

sumSquaresTwoLargest = (a, b, c) ->
  # FIXME the line below is ugly
  twoLargest = ([a, b, c].filter (x) -> x >= Math.min(a, b, c)).slice 1,3
  squares    = twoLargest.map (num) -> num * num
  squares.reduce (x,y) -> x + y


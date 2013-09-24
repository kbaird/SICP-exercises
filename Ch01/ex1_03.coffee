###
Kevin C. Baird
SICP in CoffeeScript:
  Write a function that takes 3 arguments and returns
  the sum of the squares of the 2 largest arguments.
###

sumSquaresTwoLargest = (a, b, c) ->
  twoLargest = [a, b, c].sort()[1...]
  squares    = twoLargest.map (num) -> num * num
  squares.reduce (x,y) -> x + y

console.log sumSquaresTwoLargest(0,1,2)

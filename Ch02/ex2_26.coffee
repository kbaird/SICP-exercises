###
Kevin C. Baird
SICP in CoffeeScript:
  Exercise 2.26 - playing with append/cons/list
###

x = [1, 2, 3]
y = [4, 5, 6]

append = (x, y) -> x.concat y
cons   = (x, y) -> [x].concat y
list   = (x, y) -> [x].concat [y]

console.log(append(x, y))
console.log(cons(x, y))
console.log(list(x, y))

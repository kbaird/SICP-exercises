###
Kevin C. Baird
SICP in CoffeeScript:
  Demonstrate an operator that is a compound procedure
  (i.e., not known at compile time).
###

aPlusAbsB = (a, b) ->
  op = getOp b
  op.apply null, [a, b]

getOp = (b) ->
  add = (x, y) -> x + y
  return (add) if b > 0
  subtract = (x, y) -> x - y
  subtract

console.log aPlusAbsB 0, -4
console.log aPlusAbsB 0, 4

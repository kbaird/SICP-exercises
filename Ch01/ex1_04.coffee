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
  return ((x, y) -> x + y) if (b > 0)
  (x, y) -> x - y

console.log aPlusAbsB 0, -4
console.log aPlusAbsB 0, 4

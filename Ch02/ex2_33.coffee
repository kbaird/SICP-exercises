###
Kevin C. Baird
SICP in CoffeeScript:
 Exercise 2.33 - fill in sequence manipulations
###

car  = require('./lib/lispy').car
cdr  = require('./lib/lispy').cdr
cons = require('./lib/lispy').cons
accumulate = require('./lib/lispy').accumulate

myMap = (p, sequence) ->
  op = (x, y) -> cons(p(x), y)
  accumulate(op, [], sequence)

myAppend = (seq1, seq2) ->
  accumulate(cons, seq2, seq1)

myLength = (sequence) ->
  count = (x, y) -> y + 1
  accumulate(count, 0, sequence)

l1 = [0, 1, 2]
l2 = [3, 4, 5, 6]

double = (x) -> x * 2

exports.accumulate = accumulate

console.log myMap(double, l1)
console.log myAppend(l1, l2)
console.log myLength(l1)

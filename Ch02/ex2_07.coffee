###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 2.7 - Interval Arithmetic
###

Range = require('./range').Range

r1 = new Range 2, 9
r2 = new Range 3, 5
console.log r1
console.log r2
console.log r1.add(r2)
console.log r1.mult(r2)
console.log r1.div(r2)
console.log r1.sub(r2)

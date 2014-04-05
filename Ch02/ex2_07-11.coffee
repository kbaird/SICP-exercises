###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 2.7  - Interval Arithmetic
    Exercise 2.8  - Add sub-interval
    Exercise 2.9  - Add width
    Exercise 2.10 - Add _spans_zero error handling
    Exercise 2.11 - Add sign checks to reduce multiplication count
###

Range = require('./lib/range').Range

r1 = new Range 2, 9
r2 = new Range 3, 5
console.log r1
console.log r2
console.log r1.add(r2)
console.log r1.mult(r2)
console.log r1.multLC(r2)
console.log r1.mult2(r2)
console.log r1.sub(r2)
console.log r1.width()
console.log r1.div(r1)
console.log r1.div(r2)

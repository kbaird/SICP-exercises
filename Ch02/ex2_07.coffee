###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 2.7 - Interval Arithmetic
###

class Range
  constructor: (@start, @end) ->

  add: (otherRange) ->
    newStart = @start + otherRange.start
    newEnd   = @end   + otherRange.end
    new Range newStart, newEnd

  mult: (otherRange) ->
    p1 = @start * otherRange.start
    p2 = @start * otherRange.end
    p3 = @end   * otherRange.start
    p4 = @end   * otherRange.end
    newStart = Math.min [p1, p2, p3, p4]...
    newEnd   = Math.max [p1, p2, p3, p4]...
    new Range newStart, newEnd

  div: (otherRange) ->
    recipStart = 1.0 / otherRange.start
    recipEnd   = 1.0 / otherRange.end
    recip = new Range recipStart, recipEnd
    @mult(recip)

r1 = new Range 2, 9
r2 = new Range 3, 5
console.log r1
console.log r2
console.log r1.add(r2)
console.log r1.mult(r2)
console.log r1.div(r2)

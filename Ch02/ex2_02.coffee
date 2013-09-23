###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 2.2 - Represent line segments on a place.
###

class Point
  constructor: (@x, @y) ->

class Segment
  constructor: (@startPt, @endPt) ->
  midPt: ->
    avg     = (a, b) -> (a + b) / 2.0
    startX  = @startPt.x
    startY  = @startPt.y
    endX    = @endPt.x
    endY    = @endPt.y
    midX    = avg startX, endX
    midY    = avg startY, endY
    new Point midX, midY

p1 = new Point 0.0, 1.0
p2 = new Point 2.5, 3.2
s1 = new Segment p1, p2
p3 = s1.midPt()
console.log p3


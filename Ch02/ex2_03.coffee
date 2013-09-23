###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 2.3 - Represent rectangles on a plane
###

# FIXME: external file requires
class Point
  constructor: (@x, @y) ->

class Rectangle
  constructor: (@upperLeft, @upperRight, @lowerLeft, @lowerRight) ->

  perimeter:  -> (@_top() + @_side()) * 2.0
  area:       -> (@_top() * @_side())

  # private methods
  _distance: (pt1, pt2) ->
    xSquares = @_square(@_xDiff(pt1, pt2))
    ySquares = @_square(@_yDiff(pt1, pt2))
    Math.sqrt(xSquares + ySquares)
  _xDiff:  (pt1, pt2) -> (pt2.x - pt1.x)
  _yDiff:  (pt1, pt2) -> (pt2.y - pt1.y)
  _square: (x) -> x * x
  _top:    -> @_distance(@upperLeft,  @upperRight)
  _side:   -> @_distance(@upperRight, @lowerRight)

ulPt  = new Point 0.0, 0.0
urPt  = new Point 3.0, 0.0
llPt  = new Point 0.0, 4.0
lrPt  = new Point 3.0, 4.0
rect1 = new Rectangle ulPt, urPt, llPt, lrPt
console.log "perimeter = #{rect1.perimeter()}"
console.log "area = #{rect1.area()}"


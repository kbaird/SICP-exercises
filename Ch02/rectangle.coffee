class Rectangle
  constructor: ({ul: @upperLeft, ur: @upperRight, ll: @lowerLeft, lr: @lowerRight}) ->

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

exports.Rectangle = Rectangle

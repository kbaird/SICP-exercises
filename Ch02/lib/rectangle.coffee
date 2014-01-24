class Rectangle
  constructor: ({ ul: @ul, ur: @ur, ll: @ll, lr: @lr }) ->
  # Corner naming: Upper vs. Lower, Left vs. Right

  perimeter: -> (@_top() + @_side()) * 2.0
  area:      -> (@_top() * @_side())

  # private methods
  _distance: (pt1, pt2) ->
    square   = (x) -> x * x
    xDiff    = (pt1, pt2) -> (pt2.x - pt1.x)
    yDiff    = (pt1, pt2) -> (pt2.y - pt1.y)
    xSquares = square(xDiff(pt1, pt2))
    ySquares = square(yDiff(pt1, pt2))
    Math.sqrt(xSquares + ySquares)
  _top:  -> @_distance(@ul, @ur)
  _side: -> @_distance(@ur, @lr)

exports.Rectangle = Rectangle

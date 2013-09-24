Point = require('./point').Point

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

exports.Segment = Segment

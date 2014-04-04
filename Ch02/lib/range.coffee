class Range
  constructor: (@start, @end) ->

  add: (otherRange) ->
    add = (x, y) -> (x + y)
    @_applyToOtherRange(add, otherRange)

  div: (otherRange) ->
    throw "Can't divide by 0." if @_spansZero
    recipStart = 1.0 / otherRange.start
    recipEnd   = 1.0 / otherRange.end
    recip      = new Range recipStart, recipEnd
    @mult(recip)

  mult: (otherRange) ->
    p1       = @start * otherRange.start
    p2       = @start * otherRange.end
    p3       = @end   * otherRange.start
    p4       = @end   * otherRange.end
    newStart = Math.min [p1, p2, p3, p4]...
    newEnd   = Math.max [p1, p2, p3, p4]...

# Can also be done with list comprehensions:
    [p1, p2] = (r * @start for r in [otherRange.start, otherRange.end])
    [p3, p4] = (r * @end   for r in [otherRange.start, otherRange.end])
    [newStart, newEnd] = (Math[f] [p1, p2, p3, p4]... for f in ['min', 'max'])

    new Range newStart, newEnd

  mult2: (otherRange) ->
    xlo = @start
    xhi = @end
    ylo = otherRange.start
    yhi = otherRange.end
    if (xlo >= 0 and xhi >= 0 and ylo >= 0 and yhi >= 0)
      new Range (xlo * ylo), (xhi * yhi)
    else if (xlo >= 0 and xhi >= 0 and ylo <= 0 and yhi >= 0)
      new Range (xhi * ylo), (xhi * yhi)
    else if (xlo >= 0 and xhi >= 0 and ylo <= 0 and yhi <= 0)
      new Range (xhi * ylo), (xlo * yhi)
    else if (xlo <= 0 and xhi >= 0 and ylo >= 0 and yhi >= 0)
      new Range (xlo * yhi), (xhi * yhi)
    else if (xlo <= 0 and xhi >= 0 and ylo <= 0 and yhi >= 0)
      newStart = Math.min [(xhi * ylo), (xlo * yhi)]
      newEnd   = Math.max [(xlo * ylo), (xhi * yhi)]
      new Range newStart, newEnd
    else if (xlo <= 0 and xhi >= 0 and ylo <= 0 and yhi <= 0)
      new Range (xhi * ylo), (xlo * ylo)
    else if (xlo <= 0 and xhi <= 0 and ylo >= 0 and yhi >= 0)
      new Range (xlo * yhi), (xhi * ylo)
    else if (xlo <= 0 and xhi <= 0 and ylo <= 0 and yhi >= 0)
      new Range (xlo * yhi), (xlo * ylo)
    else if (xlo <= 0 and xhi <= 0 and ylo <= 0 and yhi <= 0)
      new Range (xhi * yhi), (xlo * ylo)

  sub: (otherRange) ->
    sub = (x, y) -> (x - y)
    @_applyToOtherRange(sub, otherRange)

  width: ->
    (@end - @start) / 2.0

  # private methods
  _applyToOtherRange: (f, otherRange) ->
    newStart = f(@start, otherRange.start)
    newEnd   = f(@end,   otherRange.end)
    new Range newStart, newEnd

  _spansZero: ->
    (@start >= 0 and @end <= 0) or (@end >= 0 and @start <= 0)

exports.Range = Range

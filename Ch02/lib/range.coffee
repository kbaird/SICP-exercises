class Range
  constructor: (@start, @end) ->

  add: (otherRange) ->
    @_applyToOtherRange(@_add, otherRange)

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
# Could also be done with list comprehensions:
#[p1, p2] = (r * @start for r in [otherRange.start, otherRange.end])
#[p3, p4] = (r * @end   for r in [otherRange.start, otherRange.end])
#[newStart, newEnd] = (Math[f] [p1, p2, p3, p4]... for f in ['min', 'max'])
    new Range newStart, newEnd

  sub: (otherRange) ->
    @_applyToOtherRange(@_sub, otherRange)

  width: ->
    (@end - @start) / 2.0

  # private methods
  _add: (x, y) -> (x + y)
  _sub: (x, y) -> (x - y)

  _applyToOtherRange: (f, otherRange) ->
    newStart = f(@start, otherRange.start)
    newEnd   = f(@end,   otherRange.end)
    new Range newStart, newEnd

  _spansZero: ->
    (@start >= 0 and @end <= 0) or (@end >= 0 and @start <= 0)

exports.Range = Range

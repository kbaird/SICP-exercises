class Range
  constructor: (@start, @end) ->

  add: (otherRange) ->
    # FIXME: DRY up internals with add
    newStart = @start + otherRange.start
    newEnd   = @end   + otherRange.end
    new Range newStart, newEnd

  div: (otherRange) ->
    throw "Can't divide by 0." if @_spans_zero
    recipStart = 1.0 / otherRange.start
    recipEnd   = 1.0 / otherRange.end
    recip = new Range recipStart, recipEnd
    @mult(recip)

  mult: (otherRange) ->
    p1 = @start * otherRange.start
    p2 = @start * otherRange.end
    p3 = @end   * otherRange.start
    p4 = @end   * otherRange.end
    newStart = Math.min [p1, p2, p3, p4]...
    newEnd   = Math.max [p1, p2, p3, p4]...
    new Range newStart, newEnd

  sub: (otherRange) ->
    # FIXME: DRY up internals with add
    newStart = @start - otherRange.start
    newEnd   = @end   - otherRange.end
    new Range newStart, newEnd

  width: ->
    (@end - @start) / 2.0

  # private methods
  _spans_zero: ->
    (@start >= 0 and @end <= 0) or (@end >= 0 and @start <= 0)

exports.Range = Range

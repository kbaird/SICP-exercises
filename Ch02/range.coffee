class Range
  constructor: (@start, @end) ->

  add: (otherRange) ->
    # FIXME: DRY up internals with add
    newStart = @start + otherRange.start
    newEnd   = @end   + otherRange.end
    new Range newStart, newEnd

  div: (otherRange) ->
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

exports.Range = Range

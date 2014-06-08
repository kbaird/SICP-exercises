# Lispy procedures

car  = (l) ->
  [head, tail...] = l
  head

cdr  = (l) ->
  [head, tail...] = l
  tail

cons = (x, y) -> [x].concat(y)

accumulate = (op, initial, sequence) ->
  if sequence.length is 0 then initial else
    op(car(sequence), accumulate(op, initial, cdr(sequence)))

exports.car        = car
exports.cdr        = cdr
exports.cons       = cons
exports.accumulate = accumulate

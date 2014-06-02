# Lispy procedures

car  = (l) ->
  [head, tail...] = l
  head

cdr  = (l) ->
  [head, tail...] = l
  tail

cons = (x, y) -> [x].concat(y)

exports.car  = car
exports.cdr  = cdr
exports.cons = cons

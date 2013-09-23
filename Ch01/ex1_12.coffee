###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 1.12 - Output Pascal's Triangle via recursive process
###

pascalsTriangle = (rowNum) ->
  return []     if rowNum is 0
  return [1]    if rowNum is 1
  return [1,1]  if rowNum is 2

  pairsFromList = (args) ->
    [x, y, tail...] = args
    return []     if args.length is 0
    return [x]    if args.length is 1
    return [x+y]  if args.length is 2
    return [x+y].concat(pairsFromList([y].concat(tail)))

  summedPairs = (rowNum) ->
    previousRow = pascalsTriangle(rowNum - 1)
    pairsFromList(previousRow)

  ([1].concat(summedPairs(rowNum))).concat([1])

for num in [0..9]
  console.log pascalsTriangle(num)

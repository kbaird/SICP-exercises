###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 1.11 - define both recursive and iterative processes
###

fRec = (n) ->
  return n if (n < 3)
  fRec(n - 1) + (fRec(n - 2) * 2) + (fRec(n - 3) * 3)

fIter = (n) ->
  innerIter = (n, sum) ->
    return (n + sum) if (n < 3)
    fIter((n - 1), sum) +
      (fIter((n - 2), sum) * 2) +
      (fIter((n - 3), sum) * 3)
  innerIter(n, 0)

console.log fRec(10)
console.log fIter(10)

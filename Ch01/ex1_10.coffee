###
Kevin C. Baird
SICP CoffeeScript:
    Ackerman function
###

ackerman = (x, y) ->
  return 0        if y is 0
  return (y * 2)  if x is 0
  return 2        if y is 1
  ackerman((x - 1), ackerman(x, (y - 1)))

console.log ackerman(1, 10) # 1024
console.log ackerman(2, 4)  # 65536
console.log ackerman(3, 3)  # 65536

###
fun f(n) = ackerman(0, n)
fun g(n) = ackerman(1, n)
fun h(n) = ackerman(2, n)
###

f = (n) -> ackerman(0, n)
g = (n) -> ackerman(1, n)
h = (n) -> ackerman(2, n)

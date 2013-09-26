###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 2.6 - Church Numerals
###

zero = (f) -> ((x) -> x)
add1 = (n) -> ((x) -> (f (n(f) x)))
one  = (f) -> ((x) -> f(x))
two  = (f) -> ((x) -> f(f(x)))
plus = (n,m) ->
  ((f) -> ((x) -> (m(f)(n(f)(x)))))
plusAlt = (m) ->
  (n) -> (m(add1)(n))

churchEncode = (n) ->
  innerEncode = (f,n,x) ->
    return x if n is 0
    f(innerEncode(f,(n-1),x))
  (f) -> ((x) -> innerEncode(f,n,x))

console.log zero
console.log add1(zero)
console.log plus(zero,zero)
console.log plusAlt(zero,zero)
console.log churchEncode(17)

###
Kevin C. Baird
SICP in CoffeeScript:
  Exercise 2.25 - car/cdr combinations that return 7
###

l1 = [1, 3, [5, 7], 9]
l2 = [[7]]
l3 = [1, [2, [3, [4, [5, [6, 7]]]]]]

car    = ([head, tail...]) -> head
cdr    = ([head, tail...]) -> tail
caar   = (x) -> car(car(x))
cdaddr = (x) -> cdr(car(cdr(cdr(x))))
cadadr = (x) -> car(cdr(car(cdr(x))))

console.log(car(cdaddr(l1)))
console.log(caar(l2))
console.log(cadadr((cadadr(cadadr(l3)))))

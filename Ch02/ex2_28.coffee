###
Kevin C. Baird
SICP in CoffeeScript:
  Exercise 2.28 - fringe
###

###
(define x (list (list 1 2) (list 3 4)))
(define y (list x x))
  ;(fringe x)
  ;(1 2 3 4)
  ;(fringe (list x x))
  ;(1 2 3 4 1 2 3 4)

(define (fringe l)
  (cond
    ((null? l) l)
    ((not (pair? l)) (list l))
    (else
      (append (fringe (car l)) (fringe (cdr l))))))
###

x = [[1, 2], [3, 4]]
y = [x, x]

fringe = (items) ->
  innerFringe = (items) ->
    [head, tail...] = items
    fringe(head).concat(fringe(tail))
  if items.length is 0 then [] else
    if items.length is 2 then innerFringe(items) else items

console.log(fringe(x))
console.log(fringe(y))

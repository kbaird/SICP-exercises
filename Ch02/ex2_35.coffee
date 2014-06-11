###
Kevin C. Baird
SICP in CoffeeScript:
  Exercise 2.35 - Define count-leaves in terms of accumulate

(define (orig-count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (orig-count-leaves (car x))
                 (orig-count-leaves (cdr x))))))

; enumerate-tree from sicp 2.2.3
(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 1) (enumerate-tree t))))
###

car        = require('./lib/lispy').car
cdr        = require('./lib/lispy').cdr
cons       = require('./lib/lispy').cons
accumulate = require('./lib/lispy').accumulate

origCountLeaves = (x) ->
  if x.length is 0 then 0 else
    if x.length isnt 2 then 1 else
      origCountLeaves(car(x)) + origCountLeaves(cdr(x))

enumerateTree = (tree) ->
  if tree.length is 0 then [] else
    if tree.length isnt 2 then tree else
      [].concat(enumerateTree(car(tree)), (enumerateTree(cdr(tree))))

countLeaves = (t) ->
  add = (x,y) -> x + y
  accumulate(add, 0, (1 for x in enumerateTree(t)))

t = [1, [1,2,3]]
#u = (1 for x in enumerateTree(t))
#console.log(enumerateTree(u))
console.log(origCountLeaves(t))
console.log(countLeaves(t))

###
Kevin C. Baird
SICP in CoffeeScript:
 Exercise 2.32 - set of all subsets

(define (subsets s)
  (if (null? s)
    (list '())
    (let ((rest (subsets (cdr s)))
          (power-sets (lambda (x) (cons (car s) x))))
      (append rest (map power-sets rest)))))

(define set '(1 2 3))
###

subSets = (set) ->
  powerSets = (x) ->
    [headS, tailS...] = set
    [headS].concat(x)
  if set is [] then [] else
    [head, tail...] = set
    [tail].concat(powerSets(x) for x in tail)

set = [1, 2, 3]

console.log subSets(set)

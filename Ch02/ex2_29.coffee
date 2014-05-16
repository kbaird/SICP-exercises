###
Kevin C. Baird
SICP in CoffeeScript:
  Exercise 2.29 - mobiles
###

###
(define (make-mobile left right)
  (list left right))
;; Part d: (cons left right) instead

(define (make-branch len structure)
  (list len structure))
;; Part d: (cons len structure) instead

(define left-branch car)
(define right-branch cadr)
;; Part d: (define right-branch cdr) instead

(define branch-length car)
(define branch-structure cadr)
;; Part d: (define branch-structure cdr) instead

(define (branch-weight b)
 (if (pair? (branch-structure b))
   (total-weight (branch-structure b))
   (branch-structure b)))

(define (total-weight m)
  (define lb (left-branch m))
  (define rb (right-branch m))
  (+ (branch-weight lb) (branch-weight rb)))

(define (branch-torque b)
  (* (branch-length b) (branch-weight b)))

(define (branch-balanced? b)
  (if (pair? (branch-structure b))
    (balanced? (branch-structure b))
    #t))

(define (balanced? m)
  (define lb (left-branch m))
  (define rb (right-branch m))
  (define equal-torque (= (branch-torque lb) (branch-torque rb)))
  (and (branch-balanced? lb) (branch-balanced? rb) equal-torque))

(define lb (make-branch 3 1))
(define rb (make-branch 2 1))
(define m1 (make-mobile lb rb))
(define m2 (make-mobile lb (make-branch 4 m1)))
(define mb (make-mobile lb lb))
###

makeBranch = (len, structure) -> [len, structure]
makeMobile = (l, r) -> [l, r]

leftBranch = (b) ->
  [head, tail...] = b
  head

rightBranch = (b) ->
  [head, tail...] = b
  tail


x = [[1, 2], [3, 4]]
y = [x, x]

fringe = (items) ->
  if items.length is 0 then [] else
    [head, tail...] = items
    [].concat(head...).concat fringe(tail)

console.log(fringe(x)) # want [1, 2, 3, 4]
console.log(fringe(y)) # want [1, 2, 3, 4, 1, 2, 3, 4]

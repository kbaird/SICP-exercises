;; ex2_29.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.29 - mobiles

(define (make-mobile left right)
 (list left right))

(define (make-branch len structure)
 (list len structure))

(define left-branch car)
(define right-branch cadr)

(define branch-length car)
(define branch-structure cadr)

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

(define (balanced? m)
 (define lb (left-branch m))
 (define rb (right-branch m))
 (define equal-torque (= (branch-torque lb) (branch-torque rb)))
 (and (balanced? lb) (balanced? rb) equal-torque))

(define lb (make-branch 3 1))
(define rb (make-branch 2 1))
(define m1 (make-mobile lb rb))
(define m2 (make-mobile lb (make-branch 4 m1)))


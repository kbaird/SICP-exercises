;; ex2_04.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.4 - Alternate defs of cons, car, cdr

(define (my-cons x y)
  (lambda (m) (m x y)))

(define (my-car z)
  (z (lambda (p q) p)))

(define (my-cdr z)
  (z (lambda (p q) q)))

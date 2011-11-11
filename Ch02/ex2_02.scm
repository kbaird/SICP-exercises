;; ex2_02.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.2 - Represent line segments on a plane

(define (make-segment start-pt end-pt)
  (cons start-pt end-pt))
(define (start-segment seg)
  (car seg))
(define (end-segment seg)
  (cdr seg))
(define (make-point x y)
  (cons x y))
(define (x-point pt)
  (car pt))
(define (y-point pt)
  (cdr pt))


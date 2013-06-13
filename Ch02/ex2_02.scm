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
(define (midpoint-segment seg)
  (define (average x y) (/ (+ x y) 2))
  (make-point
    (average (x-point (start-segment seg)) (x-point (end-segment seg)))
    (average (y-point (start-segment seg)) (y-point (end-segment seg)))))
(define (make-point x y)
  (cons x y))
(define (x-point pt)
  (car pt))
(define (y-point pt)
  (cdr pt))


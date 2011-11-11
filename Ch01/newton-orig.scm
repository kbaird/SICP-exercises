;; newton.scm
;; Kevin C. Baird
;; SICP
;; Calculate square roots using Newton's method (Example 1.1.7)

(define (sqrt x)
  (define (sqrt-iter guess x)
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (average x y)
    (/ (+ x y) 2))
  (define tolerance 0.001)
  (define (square x)
    (* x x))
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) tolerance))
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))
  (sqrt-iter 1.0 x))

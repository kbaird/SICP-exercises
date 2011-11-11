;; ex1_07.scm
;; Kevin C. Baird
;; SICP
;; Redefine the tolerance to be a certain fraction of 
;; the guess, rather than a constant value.

(define (sqrt x)
  (define (sqrt-iter guess x)
    (define (improve guess x)
      (average guess (/ x guess)))
    (define (average x y)
      (/ (+ x y) 2))
    (define (tolerance guess)
      (* guess 0.001))
    (define (square x)
      (* x x))
    (define (good-enough? guess x)
      (< (abs (- (square guess) x)) (tolerance guess)))
    (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
  (sqrt-iter 1.0 x))

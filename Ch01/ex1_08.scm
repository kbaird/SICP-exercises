;; ex1_08.scm
;; Kevin C. Baird
;; SICP
;; Calculate cube roots using Newton's Method (Exercise 1.8).

(define (cbrt x)
  (define (cbrt-iter guess x)
    (define (improve guess x)
      (/
        (+
          (/ x
             (square guess))
          (* 2 guess))
        3))
    (define (average x y)
      (/ (+ x y) 2))
    (define tolerance 0.001)
    (define (square x)
      (* x x))
    (define (cube x)
      (* x x x))
    (define (good-enough? guess x)
      (< (abs (- (cube guess) x)) tolerance))
    (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
                 x)))
  (cbrt-iter 1.0 x))

;; newton.scm
;; Kevin C. Baird
;; SICP
;; Calculate square roots using Newton's method (Example 1.1.7)

(define (sqrt x)
  (define (average x y)
    (/ (+ x y) 2))
  (define tolerance 0.001)
  (define (square x)
    (* x x))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) tolerance))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
      guess
      (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

; Improved with block structure/lexical scoping
; as detailed in Section 1.1.8 (using free variables).

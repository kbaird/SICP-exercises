;; ex1_06.scm
;; Kevin C. Baird
;; SICP
;; Replace if with new-if (Exercise 1.6)

(define (sqrt x)
  (define (sqrt-iter guess x)
    (define (new-if predicate then-clause else-clause)
      (cond (predicate then-clause)
            (else else-clause)))
    (define (improve guess x)
      (average guess (/ x guess)))
    (define (average x y)
      (/ (+ x y) 2))
    (define tolerance 0.001)
    (define (square x)
      (* x x))
    (define (good-enough? guess x)
      (< (abs (- (square guess) x)) tolerance))
    (new-if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x)
                       x)))
  (sqrt-iter 1.0 x))

; Trying to use sqrt results in a stack overflow.
; This is because the applicative-order keeps replacing
; 'new-if' with its definition inside sqrt-iter. Since
; sqrt-iter is defined recursively, the replacement
; process never terminates.

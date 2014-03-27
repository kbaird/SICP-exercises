;; ex2_34.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.34 - Horner's Rule

(define (accumulate op initial sequence)
 (if (null? sequence)
  initial
  (op (car sequence)
   (accumulate op initial (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
 (define (f this-coeff higher-terms)
  (+ (* x higher-terms) this-coeff))
 (accumulate f 0 coefficient-sequence))

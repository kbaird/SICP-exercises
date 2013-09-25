;; ex2_06.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.6 - Church Numerals

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; define one
(define one
  (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x)))))

; define two
(define (two)
  (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x)))) f) x)))))

; define +

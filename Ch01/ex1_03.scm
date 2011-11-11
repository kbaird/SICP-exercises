;; ex1_03.scm
;; Kevin C. Baird
;; SICP
;; Write a function that takes 3 arguments and returns the
;; sum of the squares of the 2 largest arguments.

(define (square x) 
  (* x x))

(define (sum-squares-2-largest a b c)
  (define lowest 
    (min a b c))
  (define sum-all-squares 
    (+ (square a) (square b) (square c)))
  (- sum-all-squares (square lowest)))

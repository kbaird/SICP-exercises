;; ex1_04.scm
;; Kevin C. Baird
;; SICP
;; Demonstrate an operator that is a compound expression
;; (i.e. not known at compile time).

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

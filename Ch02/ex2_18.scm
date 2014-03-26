;; ex2_18.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.18 - reverse

(define (reverse items)
 (if (null? items)
  items
  (append (reverse (cdr items)) (list (car items)))))

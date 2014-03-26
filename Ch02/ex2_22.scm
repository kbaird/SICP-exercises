;; ex2_22.scm
;; Kevin C. Baird
;; SICP
;; Make square-list iterative

(load "ex2_18.scm") ; reverse

(define (square-list items)
 (define nil '())
 (define (square x) (* x x))
 (define (iter things answer)
  (if (null? things)
   answer
   (iter (cdr things)
    (cons (square (car things)) answer)
    ;(cons answer (square (car things)))
    )))
 ;(iter items nil))
 (reverse (iter items nil)))


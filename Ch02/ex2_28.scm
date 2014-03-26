;; ex2_28.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.28 - fringe

(define x (list (list 1 2) (list 3 4)))
(define y (list x x))
  ;(fringe x)
  ;(1 2 3 4)
  ;(fringe (list x x))
  ;(1 2 3 4 1 2 3 4)

(define (fringe l)
 (cond
  ((null? l) l)
  ((not (pair? l)) (list l))
  (else
   (append (fringe (car l)) (fringe (cdr l))))))

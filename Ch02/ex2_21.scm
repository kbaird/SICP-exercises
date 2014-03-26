;; ex2_21.scm
;; Kevin C. Baird
;; SICP
;; Define 2 versions of square-list

(define (square-list1 items)
(if (null? items)
 '()
 (cons
  ((lambda (x) (* x x)) (car items))
  (square-list1 (cdr items)))))

(define (square-list2 items)
 (map (lambda (x) (* x x)) items))


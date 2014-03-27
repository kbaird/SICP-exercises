;; ex2_32.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.32 - set of all subsets

(define (subsets s)
 (if (null? s)
  (list '())
  (let ((rest (subsets (cdr s)))
        (power-sets (lambda (x) (cons (car s) x))))
   (append rest (map power-sets rest)))))

(define set '(1 2 3))

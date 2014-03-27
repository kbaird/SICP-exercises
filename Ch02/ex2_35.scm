;; ex2_35.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.35 - Define count-leaves in terms of accumulate

(define (orig-count-leaves x)
 (cond ((null? x) 0)
  ((not (pair? x)) 1)
  (else (+ (orig-count-leaves (car x))
         (orig-count-leaves (cdr x))))))

; accumulate from sicp section 2.2.3
(define (accumulate op initial sequence)
 (if (null? sequence)
  initial
  (op (car sequence)
   (accumulate op initial (cdr sequence)))))

; enumerate-tree from sicp 2.2.3
(define (enumerate-tree tree)
 (cond ((null? tree) '())
  ((not (pair? tree)) (list tree))
  (else (append (enumerate-tree (car tree))
         (enumerate-tree (cdr tree))))))

(define (count-leaves t)
 (accumulate + 0 (map (lambda (x) 1) (enumerate-tree t))))

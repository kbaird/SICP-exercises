;; ex2_27.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.27 - deep reverse

(define (deep-reverse items)
 (cond ((null? items) '())
  ((pair? (car items))
   (append (deep-reverse (cdr items))
    (list (deep-reverse (car items)))))
  (else
   (append (deep-reverse (cdr items))
    (list (car items))))))


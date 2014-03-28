;; ex2_23.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.23 - for-each

(define (for-each f items)
  (cond ((null? items) #t)
        (else (f (car items))
              (for-each f (cdr items)))))

(for-each (lambda (x)
            (newline)
            (display x))
          (list 57 321 88))

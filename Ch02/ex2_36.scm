;; ex2_36.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.36 - Define accumulate-n

; accumulate from sicp section 2.2.3
(define (accumulate op initial sequence)
 (if (null? sequence)
  initial
  (op (car sequence)
   (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
 (if (null? (car seqs))
  '()
  (cons (accumulate op init (map car seqs))
   (accumulate-n op init (map cdr seqs)))))

;; ex2_33.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.33 - fill in sequence manipulations

(define (accumulate op initial sequence)
 (if (null? sequence)
  initial
  (op (car sequence)
   (accumulate op initial (cdr sequence)))))

(define (my-map p sequence)
 (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (my-append seq1 seq2)
 (accumulate cons seq2 seq1))
  
(define (my-length sequence)
 (accumulate (lambda (x y) (+ y 1)) 0 sequence))

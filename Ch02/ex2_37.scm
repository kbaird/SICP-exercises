;; ex2_37.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.37 - Matrix & Vector Operations

; accumulate from sicp section 2.2.3
(define (accumulate op initial sequence)
 (if (null? sequence)
  initial
  (op (car sequence)
   (accumulate op initial (cdr sequence)))))

; accumulate from sicp section 2.2.3
(define (accumulate-n op init seqs)
 (if (null? (car seqs))
  '()
  (cons (accumulate op init (map car seqs))
   (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
 (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
 (map "TODO" m))

(define (matrix-*-matrix m n)
 (let ((cols (transpose n)))
  (map "TODO" m)))

(define (transpose m)
 (accumulate-n cons '() (map car m)))


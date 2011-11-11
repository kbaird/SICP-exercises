;; ex1_12.scm
;; Kevin C. Baird
;; SICP
;; Exercise 1.12 - Output Pascal's Triangle via a recursive process

(define (pascals-triangle row-num)

  (define (summed-pairs row-num)
    

  (cond ((= row-num 0) ())
        ((= row-num 1) (1))
        ((= row-num 2) (1 1))
        (else (1 (summed-pairs row-num) 1))))

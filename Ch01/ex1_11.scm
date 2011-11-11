;; ex1_11.scm
;; Kevin C. Baird
;; SICP
;; Exercise 1.11 - define both recursive and iterative processes

(define (f-rec n)
  (cond ((< n 3) n)
        (else (+ (f-rec (- n 1))
                 (* 2 (f-rec (- n 2)))
                 (* 3 (f-rec (- n 3)))))))

(define (f-iter n)

  (define (f-iter2 n sum)
    (cond ((< n 3) (+ sum n))
          (else (+ (f-iter2 (- n 1) sum)
                   (* 2 (f-iter2 (- n 2) sum))
                   (* 3 (f-iter2 (- n 3) sum))))))

  (f-iter2 n 0))

;; ex2_17.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.17 - last-pair

(define (last-pair l)
  (cond
    ((= (length l) 1) l)
    ((> (length l) 1) (last-pair (cdr l)))))


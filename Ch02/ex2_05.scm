;; ex2_05.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.5 - Represent pair (a,b) as 2 ** a * 3 ** b

(define (my-cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (my-car z)
  (define (inner-car a b)
    (if (even? a)
      (inner-car (/ a 2) (+ b 1))
      b))
  (inner-car z 0))

(define (my-cdr z)
  (define (inner-cdr a b)
    (define (div3? x)
      (= (modulo x 3) 0))
    (if (div3? a)
      (inner-cdr (/ a 3) (+ b 1))
      b))
  (inner-cdr z 0))

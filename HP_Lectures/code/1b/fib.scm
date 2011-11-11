;; fib.scm
;;

(define (fib n)
  (fib1 n))

(define (fib1 n)
  (if (< n 2)
    n
    (+ (fib1 (- n 1))
       (fib1 (- n 2)))))

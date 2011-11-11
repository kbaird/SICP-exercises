;; ex1_10.scm
;; Kevin C. Baird
;; SICP
;; Ackermann function

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; (A 1 10) = 1024
; (A 2 4)  = 65536
; (A 3 3)  = 65536

(define (f n) (A 0 n))   ; (f x) -> x * 2
(define (g n) (A 1 n))   ; (g x) -> 2 ** x if x > 0; 0 if x == 0; error if x < 0
(define (h n) (A 2 n))   ; (h x) -> (0 2 4 16 65536) read at index x if 0 <= x <= 4; error otherwise
(define (k n) (* 5 n n)) ; (k x) -> 5 n squared


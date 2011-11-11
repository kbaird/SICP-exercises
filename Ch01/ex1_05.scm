;; ex1_05.scm
;; Kevin C. Baird
;; SICP
;; Test applicative-order ("evaluate args and then apply")
;; vs. 
;; normal-order ("fully expand and then reduce")
;; evaluation.

(define (p) (p))
(define (test x y)
  (if (= x 0)
    0
    y))

; A normal-order process would conver the expression
; (test 0 (p)) to
; (if (= 0 0) 0 (p)), find that zero does equal zero, and return zero.
;
; The applicative-order process that is really used keeps trying to 
; convert p into (p), and does so endlessly, before ever expanding the 
; definition of test.

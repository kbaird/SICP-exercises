;; ex1_9b.scm
;; Kevin C. Baird
;; SICP
;; Add two positive integers, part II

(define (+ a b)
  (if (= a 0)
    b
    (+ (dec a) (inc b))))

; follow the subtitution model for (+ 4 5)
;
; (+ 4 5)
; (+ (dec 4) (inc 5))
; (+ 3 6)
; (+ (dec 3) (inc 6))
; (+ 2 7)
; (+ (dec 2) (inc 7))
; (+ 1 8)
; (+ (dec 1) (inc 8))
; (+ 0 9)
; 9, via an iterative process

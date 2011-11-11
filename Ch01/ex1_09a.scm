;; ex1_9a.scm
;; Kevin C. Baird
;; SICP
;; Add two positive integers, part I

(define (+ a b)
  (if (= a 0)
    b
    (inc (+ (dec a) b))))

; Follow the substitution model for (+ 4 5)
;
; (+ 4 5)
; (inc (+ 3 5))
; (inc (inc (+ 2 5)))
; (inc (inc (inc (+ 1 5))))
; (inc (inc (inc (inc (+ 0 5)))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9, via a recursive process

;; plus.scm
;;
(define (plus x y)
  (if (= x 0)
    y
    (+ (- x 1) (+ y 1))))

(define (plus2 x y)
  (if (= x 0)
    y
    (+ 1 (+ (- x 1) y))))


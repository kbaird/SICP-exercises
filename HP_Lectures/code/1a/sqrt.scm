;; sqrt.scm
;;
(define (try guess x)
  (if (good-enough? guess x)
    guess
    (try (improve guess x) x)))

(define (sqrt x) (try 1 x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x))
     .001))

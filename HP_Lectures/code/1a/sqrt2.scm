;; sqrt2.scm
;;
(define (sqrt x)
  (define (average x y)
    (/ (+ x y) 2))
  (define (square x)
    (* x x))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- (square guess) x))
       .001))
  (define (try guess)
    (if (good-enough? guess)
      guess
      (try (improve guess))))
  (try 1))


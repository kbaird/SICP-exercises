;; Newton's method for finding the roots of the function f
;; To find a y such that f(y) = 0
;; Start with a guess called y0
;; yn+1 = yn - ( f(yn) / (df/dyn) )

;; building blocks
(define (fixed-point f start)
  (define tolerance 0.00001)
  (define (close-enuf? u v)
    (< (abs (- u v)) tolerance))
  (define (iter old new)
    (if (close-enuf? old new)
      new
      (iter new (f new))))
  (iter start (f start)))
(define square (lambda (x) (* x x)))

;; top-level guts
(define (sqrt x)
  (newton (lambda (y) (- x (square y)))
          1))

;; more building blocks
(define (newton f guess)
  (define df (deriv f))
  (fixed-point
    (lambda (x) (- x (/ (f x) (df x))))
    guess))

;; based on a question from an HP employee
;; all this does is use (deriv f) in place of the defined df
(define (newton-alt f guess)
  (fixed-point
    (lambda (x) (- x (/ (f x) ((deriv f) x))))
    guess))

(define deriv
  (lambda (f)
    (lambda (x)
      ; just define an arbitrary low value for dx
      (define dx .000001)
      (/ (- (f (+ x dx))
            (f x))
         dx))))


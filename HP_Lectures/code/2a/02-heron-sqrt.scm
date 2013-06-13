;; heron-sqrt.scm
;; Heron of Alexandria's square root method

;; building-blocks
(define (average x y)
  (/ (+ x y) 2))

;; GJS original presentation
(define (sqrt-orig x)
  (define tolerance 0.00001)
  (define (good-enuf? y)
    (< (abs (- (* y y) x)) tolerance))
  (define (improve y)
    (average (/ x y) y))
  (define (try y)
    (if (good-enuf? y)
    y
    (try (improve y))))
  (try 1))

;; Tries to find the fixed-point of the sqrt function -
;; that value which when passed into a given function
;; results in itself out.

(define (sqrt-fp1 x)
  (fixed-point
    (lambda (y) (average (/ x y) y))
    1))

(define (fixed-point f start)
  (define tolerance 0.00001)
  (define (close-enuf? u v)
    (< (abs (- u v)) tolerance))
  (define (iter old new)
    (if (close-enuf? old new)
      new
      (iter new (f new))))
  (iter start (f start)))

;; Higher-order
(define average-damp
  (lambda (f)
    (lambda (x) (average (f x) x))))

;; Higher-order, no lambdas
(define (average-damp-with-no-lambdas f)
  (define (foo x)
    (average (f x) x))
  foo)

(define (sqrt x)
  (fixed-point
    (average-damp (lambda (y) (/ x y)))
    1))


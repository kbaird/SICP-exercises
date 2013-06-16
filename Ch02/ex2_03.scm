;; ex2_02.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.3 - Represent rectangles on a plane

(load "ex2_02.scm")

(define (make-rectangle ul ur ll lr)
  (list ul ur ll lr))

(define (ul rect) (car    rect))
(define (ur rect) (cadr   rect))
(define (ll rect) (caddr  rect))
(define (lr rect) (cadddr rect))

(define (distance pt1 pt2)
  (define x-diff (- (x-point pt2) (x-point pt1)))
  (define y-diff (- (y-point pt2) (y-point pt1)))
  (define (square x) (* x x))
  (sqrt (+ (square x-diff) (square y-diff))))

(define (area rect)
  (* (distance (ul rect) (ur rect))
     (distance (ur rect) (lr rect))))

(define (perimeter rect)
  (+ (distance (ul rect) (ur rect))
     (distance (ur rect) (lr rect))
     (distance (lr rect) (ll rect))
     (distance (ll rect) (ul rect))))

(define ul-pt (make-point 0 0))
(define ur-pt (make-point 3 0))
(define ll-pt (make-point 0 -4))
(define lr-pt (make-point 3 -4))
(define rect1 (make-rectangle ul-pt ur-pt ll-pt lr-pt))
(define p (perimeter rect1))
(define a (area rect1))

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

(define (side-length pt1 pt2)
  (define x-distance
    (abs (- (x-point pt1) (x-point pt2))))
  (define y-distance
    (abs (- (y-point pt1) (y-point pt2))))
  (+ x-distance y-distance))

(define (area rect)
  (* (side-length (ul rect) (ur rect))
     (side-length (ur rect) (lr rect))))

(define (perimeter rect)
  (+ (side-length (ul rect) (ur rect))
     (side-length (ur rect) (lr rect))
     (side-length (lr rect) (ll rect))
     (side-length (ll rect) (ul rect))))

(define ul-pt (make-point 3 0))
(define ur-pt (make-point 3 -4))
(define ll-pt (make-point 0 0))
(define lr-pt (make-point 0 -4))
(define rect1 (make-rectangle ul-pt ur-pt ll-pt lr-pt))

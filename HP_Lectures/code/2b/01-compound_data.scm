;; procedures for adding fractions
;; 1/2 + 1/4 = 3/4
;; 3/4 * 2/3 = 1/2
;;
;; The general rules are:
;; n1/d1 + n2/d2 = ((n1 * d2 + (n2 * d1)) / (d1 * d2)
;;
;; n1/d1 * n2/d2 = (n1 * n2) / (d1 * d2)
;;

; wishful thinking - assume we have these procedures
; (make-rat n d) -> rat
; (numer rat) -> n
; (denom rat) -> d

(define (+rat x y)
  (make-rat 
    (+ (* (numer x) (denom y))
       (* (numer y) (denom x)))
    (* (denom x) (denom y))))

(define (*rat x y)
  (make-rat 
    (* (numer x) (numer y))
    (* (denom x) (denom y))))

; now define the constructor make-rat 
; and the selectors numer and denom
(define (make-rat-no-gcd n d)
  (cons n d))
(define (numer pair)
  (car pair))
(define (denom pair)
  (cdr pair))

; The above doesn't reduce to simplest form
; This one does, with gcd
(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g)
          (/ d g))))

; This consing representation can be used for other data, 
; such as vectors on a plane:
(define (make-vector x y) 
  (cons x y))
(define (xcor p) 
  (car p))
(define (ycor p) 
  (cdr p))
; and line segments on a plane:
(define (make-seg p q) 
  (cons p q))
(define (seg-start s) 
  (car s))
(define (seg-end s)
  (cdr s))
; on which operations can be done, 
; like getting the mid-point:
(define (mid-point s)
  (define (average x y)
    (/ (+ x y) 2))
  (let ((a (seg-start s))
        (b (seg-end s)))
    (make-vector
      (average (xcor a) (xcor b))
      (average (ycor a) (ycor b)))))
; or the length:
(define (seg-len s)
  (define (square x) (* x x))
  (let
    ((diff-x (- (xcor (seg-end s))
            (xcor (seg-start s))))
     (diff-y (- (ycor (seg-end s))
            (ycor (seg-start s)))))
    (sqrt (+ (square diff-x)
             (square diff-y)))))

; Now, we'll build pair operations ourselves
; "On existential nothing" (Hal Abelson).
(define (cons a b)
  (lambda (pick)
    (cond ((= pick 1) a)
          ((= pick 2) b))))
(define (car x)
  (x 1))
(define (cdr x)
  (x 2))


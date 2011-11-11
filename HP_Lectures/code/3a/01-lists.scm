;; 01-lists.scm
;;

(define (+vect v1 v2)
  (make-vector
    (+ (xcor v1) (xcor v2))
    (+ (ycor v1) (ycor v2))))

(define (scale s v)
  (make-vector (* s (xcor v))
               (* s (ycor v))))

; pointfree definitions - sexy
(define make-vector cons)
(define xcor car)
(define ycor cdr)

; pointfree definitions for line segments
(define make-segment cons)
(define seg-start car)
(define seg-end cdr)

; How to glue together the numbers 1 2 3 4
; A list is a convention for representing a sequence of pairs
; (cons 1 (cons 2 (cons 3 (cons 4 ()))))
; is the same as
; (list 1 2 3 4)
(define 1-to-4 (list 1 2 3 4))

; CDRing down a list with a scaling procedure
(define (scale-list scale-num list)
  (if (null? list)
    ()
    (cons (* (car list) scale-num)
          (scale-list scale-num (cdr list)))))

; Now extract the general pattern into a higher-order procedure
(define (map proc list)
  (if (null? list)
    ()
    (cons (proc (car list))
          (map proc (cdr list)))))

(define (scale-list-with-map scale-num list)
  (map (lambda (item) (* item scale-num))
       list))

(define (for-each proc list)
  (cond ((null? list) "done")
        (else (proc (car list))
              (for-each proc (cdr list)))))


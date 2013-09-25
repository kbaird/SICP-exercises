;; ex2_06.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.6 - Church Numerals

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
(define three (lambda (f) (lambda (x) (f (f (f x))))))

; define +
(define (plus n m)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))

(define plus-alt (lambda (m) (lambda (n) ((m add1) n))))

(define (church-encode n)
  (define (inner-encode f n x)
    (if (= n 0)
      x
      (f (inner-encode f (- n 1) x))))
  (lambda (f) (lambda (x) (inner-encode f n x))))

; cf. http://stackoverflow.com/questions/3912341/arithmetic-with-church-numerals
; http://en.wikipedia.org/wiki/Church_encoding

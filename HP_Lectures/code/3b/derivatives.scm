;; 01.scm

;;; LECTURE 1 - Obtaining Derivatives

(define (deriv expr var)
  (cond ((constant? expr var) 0)
        ((same-var? expr var) 1)
        ((sum? expr)
         (make-sum (deriv (a1 expr) var)
                   (deriv (a2 expr) var)))
        ((product? expr)
         (make-sum
           (make-product (m1 expr)
                         (deriv (m2 expr) var))
           (make-product (m2 expr)
                         (deriv (m1 expr) var))))
        ; and others...
        ))

(define (constant? expr var)
  (and (atom? expr)
       (not (eq? expr var))))

(define (same-var? expr var)
  (and (atom? expr)
       (eq? expr var)))

(define (sum? expr)
  (and (not (atom? expr))
       (eq? (car expr) `+)))

(define (make-sum-orig a1 a2)
  (list `+ a1 a2))

(define a1 cadr)
(define a2 caddr)

(define (product? expr)
  (and (not (atom? expr))
       (eq? (car expr) `*)))

(define (make-product-orig m1 m2)
  (list `* m1 m2))

(define m1 cadr)
(define m2 caddr)

(define foo
  (+ (* a (* x x))
     (* (* b x)
        c)))

;;; LECTURE 2 - Simplifying how expressions are represented

; redefine make-sum to simplify its own output
(define (make-sum a1 a2)
  (cond ((and (number? a1)
              (number? a2))
         (+ a1 a2))
        ((and (number? a1)
              (= a1 0))
         a2)
        ((and (number? a2)
              (= a2 0))
         a1)
        (else (make-sum-orig a1 a2))))

(define (make-product m1 m2)
  (cond ((and (number? a1)
              (number? a2))
         (* a1 a2))
        ((and (number? a1)
              (= a1 0))
         0)
        ((and (number? a1)
              (= a1 1))
         a2)
        ((and (number? a2)
              (= a2 0))
         0)
        ((and (number? a2)
              (= a2 1))
         a1)
        (else (make-product-orig m1 m2))))


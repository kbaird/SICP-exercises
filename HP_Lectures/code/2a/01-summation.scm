;; summation.scm
;;

;; building-block procedures
(define (square x)
  (* x x))
(define (make-inc-by x)
  (lambda (y) (+ x y)))
(define (1+ x)
  ((make-inc-by 1) x))

;; original summation
(define (sum-int-orig a b)
  (if (< a b)
    0
    (+ a
       (sum-int-orig (+ a 1) b))))

;; sum of squares, almost identical
(define (sum-sq-orig a b)
  (if (< a b)
    0
    (+ (square a)
       (sum-sq-orig (+ a 1) b))))

;; Liebnitz's Pi sum algorithm; very similar again
(define (pi-sum-orig a b)
  (if (> a b)
    0
    (+ (/ 1 (* a (+ a 2)))
       (pi-sum-orig (+ a 4) b))))

;; general pattern
;; (define (<name> a b)
;;   (if (> a b)
;;     0
;;     (+ (<term> a)
;;        (<name> (<next> a) b))))

;; define the generic case
(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term
            (next a)
            next
            b))))

;; now define specifics based on the generic case
(define (sum-int a b)
  (define (identity a) a)
  (sum identity a 1+ b))

(define (sum-sq a b)
  (sum square a 1+ b))

(define (sum-pi-internal-definitions a b)
  (define (each-addend x)
    (+ (/ 1 (* x (+ x 2)))))
  (define (4+ x)
    (make-inc-by 4))
  (sum each-addend a 4+ b))

(define (sum-pi-lambdas a b)
  (sum (lambda (i) (+ (/ 1 (* i (+ i 2)))))
       a
       (lambda (j) (+ j 4))
       b))

(define (sum-iterative term a next)
  (define (iter j ans)
    (if (> j b)
      ans
      (iter (next j)
            (* (term j) ans))))
  (iter a 0))


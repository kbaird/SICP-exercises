;; ex2_11.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.11 - add sign checks to reduce multiplication count
;; Shamelessly stolen from 
;; http://www.billthelizard.com/2010/12/sicp-27-211-extended-exercise-interval.html
(define (mul-interval x y)
  (let ((xlo (lower-bound x))
        (xhi (upper-bound x))
        (ylo (lower-bound y))
        (yhi (upper-bound y)))
    (cond ((and (>= xlo 0)
                (>= xhi 0)
                (>= ylo 0)
                (>= yhi 0))
           ; [+, +] * [+, +]
           (make-interval (* xlo ylo) (* xhi yhi)))
          ((and (>= xlo 0)
                (>= xhi 0)
                (<= ylo 0)
                (>= yhi 0))
           ; [+, +] * [-, +]
           (make-interval (* xhi ylo) (* xhi yhi)))
          ((and (>= xlo 0)
                (>= xhi 0)
                (<= ylo 0)
                (<= yhi 0))
           ; [+, +] * [-, -]
           (make-interval (* xhi ylo) (* xlo yhi)))
          ((and (<= xlo 0)
                (>= xhi 0)
                (>= ylo 0)
                (>= yhi 0))
           ; [-, +] * [+, +]
           (make-interval (* xlo yhi) (* xhi yhi)))
          ((and (<= xlo 0)
                (>= xhi 0)
                (<= ylo 0)
                (>= yhi 0))
           ; [-, +] * [-, +]
           (make-interval (min (* xhi ylo) (* xlo yhi))
                          (max (* xlo ylo) (* xhi yhi))))
          ((and (<= xlo 0)
                (>= xhi 0)
                (<= ylo 0)
                (<= yhi 0))
           ; [-, +] * [-, -]
           (make-interval (* xhi ylo) (* xlo ylo)))
          ((and (<= xlo 0)
                (<= xhi 0)
                (>= ylo 0)
                (>= yhi 0))
           ; [-, -] * [+, +]
           (make-interval (* xlo yhi) (* xhi ylo)))
          ((and (<= xlo 0)
                (<= xhi 0)
                (<= ylo 0)
                (>= yhi 0))
           ; [-, -] * [-, +]
           (make-interval (* xlo yhi) (* xlo ylo)))
          ((and (<= xlo 0)
                (<= xhi 0)
                (<= ylo 0)
                (<= yhi 0))
           ; [-, -] * [-, -]
           (make-interval (* xhi yhi) (* xlo ylo))))))

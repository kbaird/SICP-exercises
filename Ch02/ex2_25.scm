;; ex2_25.scm
;; Kevin C. Baird
;; SICP
;; Exercise 2.25 - car/cdr combinations that return 7

(define l1 '(1 3 (5 7) 9))
(define l2 '((7)))
(define l3 '(1 (2 (3 (4 (5 (6 7)))))))

(car (cdaddr l1))
(caar l2)
(cadadr (cadadr (cadadr l3)))

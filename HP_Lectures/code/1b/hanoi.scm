;; hanoi.scm
;;
(define (move n from to spare)
  (define (print-move from to)
    "moving")
  (cond ((= n 0) "done")
        (else
          (move (- n 1) from spare to)
          (print-move from to)
          (move (- n 1) spare to from))))

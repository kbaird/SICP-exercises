;; count_change.scm
;; Kevin C. Baird
;; SICP
;; Count the number of ways to make change

(define (count-change amount)

  ; define internal cc procedure
  (define (cc amount kinds-of-coins)

    ; There is only 1 coin inventory that expresses no money at all
    (cond ((= amount 0) 1)

          ; Additionally, we can not express negative amounts of money,
          ; nor can we make change with no available coin types, so
          ; there are zero ways to make change under those conditions
          ((or (< amount 0) (= kinds-of-coins 0)) 0)

          ; Now make change with the highest-value coin,
          ; and add the ways we can make change for the amount
          ; minus that coin, since that coin is not available anymore
          (else (+ (cc amount
                       (- kinds-of-coins 1))
                   (cc (- amount
                          (first-denomination kinds-of-coins))
                       kinds-of-coins)))))

  ; define internal kinds-of-coins procedure for US coinage definitions
  ; change as needed, possibly making definitions an arg to count-change
  (define (first-denomination kinds-of-coins)
    (cond ((= kinds-of-coins 1) 1)
          ((= kinds-of-coins 2) 5)
          ((= kinds-of-coins 3) 10)
          ((= kinds-of-coins 4) 25)
          ((= kinds-of-coins 5) 50)))

  ; call internal cc procedure with US coin set
  (cc amount 5))


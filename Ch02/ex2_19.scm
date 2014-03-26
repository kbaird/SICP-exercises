;; ex2_19.scm
;; Kevin C. Baird
;; SICP
;; Count the number of ways to make change,
;; with the list of coins as an argument

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 1 0.5))

(define (count-change amount)

  ; define internal cc procedure
  (define (cc amount coins)
   (define kinds-of-coins (length coins))

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
                       (cdr coins))
                   (cc (- amount
                          (first-denomination coins))
                       coins)))))

  (define (first-denomination coins)
   (car coins))

  ; call internal cc procedure with US coin set
  (cc amount us-coins))


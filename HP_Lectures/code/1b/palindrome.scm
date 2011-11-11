;; palindrome.scm
;; Run this with MIT/GNU Scheme, not Guile
;;
(define (palindrome? x)
  (string=? x (reverse-string x)))

;; ex2_20.scm
;; Kevin C. Baird
;; SICP
;; Add same-parity

(define (same-parity model . others)
  (define p (if (even? model) even? odd?))
  (cons model (filter p others)))


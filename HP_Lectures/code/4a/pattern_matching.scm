; 01-pattern_matching.scm

;;; LECTURE 1 - Pattern Matching

; Pattern matching rules DSL
; foo     -> matches foo
; (f a b) -> matches any list whose first element is f, 2nd is a, and 3rd is b
; (? x)   -> matches anything, call it x
; (?c x)  -> matches a constant, call it x
; (?v x)  -> matches a variable, call it x

; Skeletons
; foo     -> instantiates to itself
; (f a b) -> instantiates to a 3-element list which is the result of instantiating each of f, a, b
; (: x)   -> instantiates to the value of x

(define deriv-rules
  `(
    ; the rate of change in a constant is zero
    ( (dd (?c c) (? v))             0 )
    ; the rate of change in a var with respect to that same var is one
    ( (dd (?v v) (? v))             1 )
    ; the rate of change of an uninvolved var is also zero
    ( (dd (?v u) (? v))             0 )

    ; deriv of mult is the sum of each deriv
    ( (dd (* (? x1) (? x2)) (? v))
     (+ (dd (: x1) (: v))
        (dd (: x2) (: v)))            )

    ( (dd (* (? x1) (? x2)) (? v))
     (+ (* (: x1) (dd (: x2) (: v)))
        (* (dd (: x1) (: v)) (: x2))) )

    ( (dd (** (? x) (?c n)) (? v))
     (* (* (: n)
           (** (: x) (: (- n 1))))
        (dd (: x) (: v)))             )
    ))

(define algebra-rules 
  `(
    ; if just an operation on two simple expressions, do it
    ( ((? op) (?c e1) (?c e2))
     (: (op e1 e2))            )

    ; if the 2nd expression is constant, switch places so the 
    ; constant is first (will have bug for division)
    ( ((?op) (? e1) (?c e2))
     ((: op) (: e2) (: e1))    )

    ; anything plus zero is that thing
    ( (+ 0 (? e))        (: e) )
    ; anything times one is that thing
    ( (* 1 (? e))        (: e) )
    ; anything times zero is zero
    ( (* 0 (? e))        0     )
    ; nested mults: just mult constants in place now
    ( (* (?c e1) (* (?c e2) (? e3)))
     (* (: (* e1 e2)) (: e3))              )
    ; nested mults: pull e2 forward for re-evaluation
    ( (* (? e1) (* (? e2) (? e3)))
     (* (: e2) (* (: e1) (: e3)))          )
    
    ( (+ (* (? c) (? a)) (* (?c d) (? a)))
     (* (: (* c d)) (: a))                 )

    ( (* (? c) (+ (? d) (? e)))
     (+ (* (: c) (: d)) (* (: c) (: e)))   )

    ))

(define dsimp
  (simplifier deriv-rules))
; such that (dsimp `(dd (+ x y) x)) -> (+ 1 0)

(define asimp
  (simplifier algebra-rules))

;;; LECTURE 2 - Rule-Based Substitution

;; MATCHER takes an expression, pattern, and dictionary, returning a modified dictionary

(define (match pat exp dict)
  (cond 
    ; a failed dict coming in can't be "unfailed"
    ((eq? dict `failed) `failed)

    ;; ATOMIC PATTERNS
    ((atom? pat)
     (if (atom? exp)
       (if (eq? pat exp)
         ; keep the same dict if they match
         dict
         ; failed match if they aren't the same
         `failed)
       ; failed match if exp is not atomic
       `failed))
    
    ;; PATTERN EXPRESSIONS
    ((arbitrary-constant? pat)
     (if (constant? exp)
       (extend-dict pat exp dict)
       `failed))
    ((arbitrary-variable? pat)
     (if (variable? exp)
       (extend-dict pat exp dict)
       `failed))
    ((arbitrary-expression? pat)
     (extend-dict pat exp dict))
    
    ; if the expression is atomic but the pattern isn't, they can't match
    ((atom? exp) `failed)

    ;; COMPLEX MATCHING
    (else
      ; match the cdrs using "subdict"
      (match (cdr pat)
             (cdr exp)
      ; "sub-dict" is the dict resulting from trying to match the cars
             (match 
               (car pat)
               (car exp)
               dict)))))

;; INSTANTIATOR takes a skeleton and a dict, returning post-substitution expressions

(define (instantiate skeleton dict)
  (define (loop s)
    (cond ((atom? s) s)
          ((skeleton-evaluation? s)
           (evaluate (eval-exp s) dict))
          (else (cons (loop (car s))
                      (loop (cdr s))))))
  (loop skeleton))

(define (evaluate form dict)
  (if (atom? form)
    (lookup form dict)
    (apply
      (eval (lookup (car form) dict)
            user-initial-environment)
      (mapcar (lambda (v)
                (lookup v dict))
              (cdr form)))))

;;; LECTURE 3 - Simplifier

(define (simplifier the-rules)
  
  ;(define (simplify-exp-orig exp)
  ;  (try-rules (if (compound? exp)
  ;               (simplify-parts exp)
  ;               exp)))
  ;
  ;(define (simplify-parts exp)
  ;  (if (null? )
  ;    `()
  ;    (cons (simplify-exp (car exp))
  ;          (simplify-parts (cdr exp)))))
  

  ; Alternate version of simplify-exp that uses map
  ; (and therefore doesn't need simplify-parts)
  (define (simplify-exp exp)
    (try-rules
      (if (compound? exp)
        (map simplify-exp exp)
        exp)))
  
  (define (try-rules exp)
    
    (define (scan rules)
      (if (null? rules)
        exp
        (let ((dict
                (match (pattern (car rules))
                       exp
                       (empty-dictionary))))
          (if (eq? dict `failed)
            (scan (cdr rules))
            (simplify-exp
              (instantiate
                (skeleton (car rules))
                dict))))))

    (scan the-rules))
  
  simplify-exp)

; Alternate version of simplify-exp that uses map
(define (simplify-exp-alt exp)
  (try-rules
    (if (compound? exp)
      (map simplify-exp-alt exp)
      exp)))

; Now define the dictionary
(define (empty-dictionary) `())

(define (extend-dict part dat dict)
  (let ((name (variable-name pat)))
    (let ((v (assq name dict)))
      (cond ((null? v)
             (cons (list name dat) dict))
            ((eq? (cadr v) dat) dict)
            (else `failed)))))

(define (lookup var dict)
  (let ((v (assq var dict)))
    (if (null? v) var (cadr v))))

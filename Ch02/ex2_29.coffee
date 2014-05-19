###
Kevin C. Baird
SICP in CoffeeScript:
  Exercise 2.29 - mobiles
###

arrayEqual = (a, b) ->
  a.length is b.length and a.every (elem, i) -> elem is b[i]

###
(define (make-branch len structure)
  (list len structure))
;; Part d: (cons len structure) instead
###
makeBranch = (len, structure) -> [len, structure]

###
(define (make-mobile left right)
  (list left right))
;; Part d: (cons left right) instead
###
makeMobile = (l, r) -> [l, r]

###
(define left-branch car)
(define right-branch cadr)
;; Part d: (define right-branch cdr) instead
###
leftBranch = (b) ->
  [head, tail...] = b
  head

rightBranch = (b) ->
  [head, tail...] = b
  leftBranch(tail)

###
(define branch-length car)
(define branch-structure cadr)
;; Part d: (define branch-structure cdr) instead
###
branchLength = (b) ->
  [head, tail...] = b
  head
  
branchStructure = (b) ->
  [head, tail...] = b
  leftBranch(tail)

###
(define (branch-weight b)
 (if (pair? (branch-structure b))
   (total-weight (branch-structure b))
   (branch-structure b)))
###
branchWeight = (b) ->
  bs = branchStructure(b)
  if bs.length is 2 then totalWeight(bs) else bs

###
(define (total-weight m)
  (define lb (left-branch m))
  (define rb (right-branch m))
  (+ (branch-weight lb) (branch-weight rb)))
###
totalWeight = (m) ->
  [lb, rb]  = [leftBranch(m), rightBranch(m)]
  branchWeight(lb) + branchWeight(rb)

###
(define (branch-torque b)
  (* (branch-length b) (branch-weight b)))
###
branchTorque = (b) ->
  branchLength(b) * branchWeight(b)

###
(define (branch-balanced? b)
  (if (pair? (branch-structure b))
    (balanced? (branch-structure b))
    #t))
###
branchBalanced = (b) ->
  bs = branchStructure(b)
  if bs.length is 2 then balanced(bs) else true

###
(define (balanced? m)
  (define lb (left-branch m))
  (define rb (right-branch m))
  (define equal-torque (= (branch-torque lb) (branch-torque rb)))
  (and (branch-balanced? lb) (branch-balanced? rb) equal-torque))
###
balanced = (m) ->
  [lb, rb]    = [leftBranch(m), rightBranch(m)]
  equalTorque = arrayEqual(lb, rb)
  equalTorque and branchBalanced(lb) and branchBalanced(rb)

###
(define lb (make-branch 3 1))
(define rb (make-branch 2 1))
(define m1 (make-mobile lb rb))
(define m2 (make-mobile lb (make-branch 4 m1)))
(define mb (make-mobile lb lb))
###
lb = makeBranch(3, 1)
rb = makeBranch(2, 1)
m1 = makeMobile(lb, rb)
m2 = makeMobile(lb, makeBranch(4, m1))
mb = makeMobile(lb, lb)

###
console.log lb
console.log branchBalanced(lb)
console.log branchLength(lb)
console.log branchWeight(lb)
console.log rb
console.log branchBalanced(rb)
console.log branchLength(rb)
console.log branchWeight(rb)
###
console.log "m1 = " + m1
console.log "m1 balanced = " + balanced(m1)
console.log "leftBranch(m1) = " + leftBranch(m1)
console.log "rightBranch(m1) = " + rightBranch(m1)
console.log "totalWeight(m1) = " + totalWeight(m1)
console.log "m2 = " + m2
console.log "totalWeight(m2) = " + totalWeight(m2)
console.log "mb = " + mb
console.log "balanced(mb) = " + balanced(mb)
console.log "balanced(makeBranch(lb, lb)) = " + balanced(makeBranch(lb, lb))

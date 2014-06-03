###
Kevin C. Baird
SICP in CoffeeScript:
  Exercise 2.29 - mobiles
###

arrayEqual = (a, b) ->
  a.length is b.length and a.every (elem, i) -> elem is b[i]

makeBranch = (len, structure) -> [len, structure]

makeMobile = (l, r) -> [l, r]

leftBranch = (b) ->
  [head, tail...] = b
  head

rightBranch = (b) ->
  [head, tail...] = b
  leftBranch(tail)

branchLength = (b) ->
  [head, tail...] = b
  head
  
branchStructure = (b) ->
  [head, tail...] = b
  leftBranch(tail)

branchWeight = (b) ->
  bs = branchStructure(b)
  if bs.length is 2 then totalWeight(bs) else bs

totalWeight = (m) ->
  [lb, rb]  = [leftBranch(m), rightBranch(m)]
  branchWeight(lb) + branchWeight(rb)

branchTorque = (b) ->
  branchLength(b) * branchWeight(b)

branchBalanced = (b) ->
  bs = branchStructure(b)
  if bs.length is 2 then balanced(bs) else true

balanced = (m) ->
  [lb, rb]    = [leftBranch(m), rightBranch(m)]
  equalTorque = arrayEqual(lb, rb)
  equalTorque and branchBalanced(lb) and branchBalanced(rb)

lb = makeBranch(3, 1)
rb = makeBranch(2, 1)
m1 = makeMobile(lb, rb)
m2 = makeMobile(lb, makeBranch(4, m1))
mb = makeMobile(lb, lb)

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

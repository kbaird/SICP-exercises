###
Kevin C. Baird
SICP in CoffeeScript:
  Exercise 2.29 - mobiles
###

arrayEqual = (a, b) ->
  a.length is b.length and a.every (elem, i) -> elem is b[i]

class Branch
  constructor: (@length, @structure) ->
    # @structure may be a Mobile

  @isBalanced: ->
    if @structure.length is 2 then @structure.isBalanced() else true
  torque: ->
    @length * @weight()

  weight: ->
    return @structure if @structure.length is 2
    @structure.weight

class Mobile
  constructor: (@leftBranch, @rightBranch) ->

  isBalanced: ->
    equalTorque = arrayEqual(@leftBranch, @rightBranch)
    equalTorque and @leftBranch.isBalanced() and @rightBranch.isBalanced()
  weight: ->
    @leftBranch.weight + @rightBranch.weight

lb = new Branch(3, 1)
rb = new Branch(2, 1)
m1 = new Mobile(lb, rb)
m2 = new Mobile(lb, new Branch(4, m1))
mb = new Mobile(lb, lb)

console.log "m1 = " + m1
console.log "m1 balanced = " + m1.isBalanced()
###
console.log "leftBranch(m1) = " + leftBranch(m1)
console.log "rightBranch(m1) = " + rightBranch(m1)
console.log "totalWeight(m1) = " + totalWeight(m1)
console.log "m2 = " + m2
console.log "totalWeight(m2) = " + totalWeight(m2)
console.log "mb = " + mb
console.log "balanced(mb) = " + balanced(mb)
console.log "balanced(makeBranch(lb, lb)) = " + balanced(makeBranch(lb, lb))
###

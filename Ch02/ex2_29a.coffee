###
Kevin C. Baird
SICP in CoffeeScript:
  Exercise 2.29 - mobiles
###

class Branch
  constructor: (@length, @structure) ->
    # @structure may be a Mobile

  display: ->
    "Branch(length: " + @length + ", structure: " + @structure + ")"

  isBalanced: ->
    if @structure.length is 2 then @structure.isBalanced() else true

  torque: ->
    @length * @weight()

  weight: ->
    return @structure if @structure.length is 2
    if (@structure instanceof Mobile) then @structure.weight() else @structure

class Mobile
  constructor: (@leftBranch, @rightBranch) ->

  display: ->
    "Mobile(leftBranch: " + @leftBranch.display() + ", rightBranch: " + @rightBranch.display() + ")"

  isBalanced: ->
    @_equalTorque() and @leftBranch.isBalanced() and @rightBranch.isBalanced()

  weight: ->
    @leftBranch.weight() + @rightBranch.weight()

  # Private Methods
  _arrayEqual: (a, b) ->
    a.length is b.length and a.every (elem, i) -> elem is b[i]

  _equalTorque: ->
    (@leftBranch.length is @rightBranch.length) and
      (@leftBranch.structure is @rightBranch.structure)

lb = new Branch(3, 1)
rb = new Branch(2, 1)
m1 = new Mobile(lb, rb)
m2 = new Mobile(lb, new Branch(4, m1))
mb = new Mobile(lb, lb)

console.log "m1 = " + m1.display()
console.log "m1.isBalanced = " + m1.isBalanced()
console.log "m1.leftBranch = " + m1.leftBranch.display()
console.log "m1.rightBranch = " + m1.rightBranch.display()
console.log "m1.weight = " + m1.weight()
console.log "m2 = " + m2.display()
console.log "m2.weight = " + m2.weight()
console.log "mb = " + mb.display()
console.log "mb.isBalanced = " + mb.isBalanced()

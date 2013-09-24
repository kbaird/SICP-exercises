###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 2.2 - Represent line segments on a place.
###

Point   = require('./point').Point
Segment = require('./segment').Segment

p1 = new Point 0.0, 1.0
p2 = new Point 2.5, 3.2
s1 = new Segment p1, p2
p3 = s1.midPt()
console.log p3


###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 2.2 - Represent line segments on a place.
###

Point   = require('./point').Point
Segment = require('./segment').Segment

p1 = new Point x: 0.0, y: 1.0
p2 = new Point x: 2.5, y: 3.2
s1 = new Segment start: p1, end: p2
p3 = s1.midPt()
console.log p3


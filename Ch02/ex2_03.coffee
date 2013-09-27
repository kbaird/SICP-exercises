###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 2.3 - Represent rectangles on a plane
###

Point     = require('./lib/point').Point
Rectangle = require('./lib/rectangle').Rectangle

ulPt  = new Point x: 0.0, y: 0.0
urPt  = new Point x: 3.0, y: 0.0
llPt  = new Point x: 0.0, y: 4.0
lrPt  = new Point x: 3.0, y: 4.0
rect1 = new Rectangle ul: ulPt, ur: urPt, ll: llPt, lr: lrPt
console.log "perimeter = #{rect1.perimeter()}"
console.log "area = #{rect1.area()}"


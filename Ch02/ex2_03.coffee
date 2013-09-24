###
Kevin C. Baird
SICP in CoffeeScript:
    Exercise 2.3 - Represent rectangles on a plane
###

Point     = require('./point').Point
Rectangle = require('./rectangle').Rectangle

ulPt  = new Point 0.0, 0.0
urPt  = new Point 3.0, 0.0
llPt  = new Point 0.0, 4.0
lrPt  = new Point 3.0, 4.0
rect1 = new Rectangle ulPt, urPt, llPt, lrPt
console.log "perimeter = #{rect1.perimeter()}"
console.log "area = #{rect1.area()}"


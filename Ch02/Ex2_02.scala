/**
  * ExX_X.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * Represent line segments on a plane
  */

/* TODO: Double instead of Int */
class Point(xc: Int, yc: Int) {
  var x: Int = xc
  var y: Int = yc
  override def toString(): String = "(" + x + ", " + y + ")";
}

class Segment(p1: Point, p2: Point) {
  var startPt: Point = p1
  var endPt: Point   = p2
  override def toString(): String = "(" + startPt + ", " + endPt + ")";
}

object Ex2_02 extends App {
  def output() = {
    val pt1 = new Point(0, 4)
    val pt2 = new Point(1, 2)
    val seg = new Segment(pt1, pt2)
    seg
  }
}

/**
  * execute with
  * scala -i Ex2_02.scala -e "println(Ex2_02.output)"
  * until I figure out a better way
  */


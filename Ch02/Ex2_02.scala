/**
  * Ex2_02.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * Represent line segments on a plane
  */

case class Point(x: Double, y: Double) {
  override def toString(): String = "(" + x + ", " + y + ")";
}

case class Segment(startPt: Point, endPt: Point) {
  override def toString(): String = "(" + startPt + ", " + endPt + ")";
  def midPoint: Point = {
    val newX = (startPt.x + endPt.x) / 2.0
    val newY = (startPt.y + endPt.y) / 2.0
    Point(newX, newY)
  }
}

def output() = {
  val pt1 = new Point(0.0, 4.2)
  val pt2 = new Point(1.6, 2.0)
  val seg = new Segment(pt1, pt2)
  seg.midPoint
}

/**
  * execute with
  * scala -i Ex2_02.scala -e "println(output)"
  * until I figure out a better way
  */


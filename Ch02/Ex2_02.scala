/**
  * Ex2_02.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * Represent line segments on a plane
  */

/* TODO: Double instead of Int */
case class Point(x: Int, y: Int) {
  override def toString(): String = "(" + x + ", " + y + ")";
}

case class Segment(startPt: Point, endPt: Point) {
  override def toString(): String = "(" + startPt + ", " + endPt + ")";
}

def output() = {
  val pt1 = new Point(0, 4)
  val pt2 = new Point(1, 2)
  val seg = new Segment(pt1, pt2)
  seg
}

/**
  * execute with
  * scala -i Ex2_02.scala -e "println(output)"
  * until I figure out a better way
  */


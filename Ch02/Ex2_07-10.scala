/**
  * Ex2_07.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * SICP in Scala:
  *   Exercise 2.7  - Interval Arithmetic
  *   Exercise 2.8  - Add sub-interval
  *   Exercise 2.9  - Add width
  *   Exercise 2.10 - Add _spans_zero error handling
  */

case class SpansZeroException(message: String) extends Exception(message)
case class Interval(head: Double, end: Double) {
  override def toString(): String = "Interval(" + head + ", " + end + ")";
  def add(otherI: Interval): Interval = {
    val newH = head + otherI.head
    val newE = end  + otherI.end
    Interval(newH, newE)
  }
  def div(otherI: Interval): Interval = {
    val spansZero = 
      (head >= 0 && end <= 0) ||
      (head <= 0 && end >= 0)
    if (spansZero)
      throw SpansZeroException("")
    val recipH = (1.0 / otherI.head): Double
    val recipE = (1.0 / otherI.end): Double
    val recip  = Interval(recipH, recipE)
    mult(recip)
  }
  def mult(otherI: Interval): Interval = {
    val p1 = head * otherI.head
    val p2 = head * otherI.end
    val p3 = end  * otherI.head
    val p4 = end  * otherI.end
    val newH = List(p1, p2, p3, p4).min
    val newE = List(p1, p2, p3, p4).max
    Interval(newH, newE)
  }
  def sub(otherI: Interval): Interval = {
    val newH = head - otherI.head
    val newE = end  - otherI.end
    Interval(newH, newE)
  }
  def width: Double = { (end - head) / 2.0 }
}

def output() = {
  val i1 = new Interval(2, 9)
  val i2 = new Interval(3, 5)
  val i3 = new Interval(-1, 5)
  (
    i1, i2,
    i1.add(i2),
    i1.sub(i2),
    i1.mult(i2),
    i1.div(i2),
    i1.width
    /*
     * error properly raised by i3.div(i1)
     */
  )
}

/**
  * execute with
  * scala -i Ex2_07-10.scala -e "println(output)"
  * until I figure out a better way
  */


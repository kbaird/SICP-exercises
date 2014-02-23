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

def addRanges(r1: Range, r2: Range) = {
  val newHead = r1.head + r2.head
  val newEnd  = r1.end  + r2.end
  newHead to newEnd
}

/* Scala Ranges have Int members. TODO
def divRanges(r1: Range, r2: Range) = {
  val recipHead = (1.0 / r2.head): Double
  val recipEnd  = (1.0 / r2.end): Double
  val recip     = (recipHead to recipEnd): Range
  multRanges(r1, recip)
}
*/

def multRanges(r1: Range, r2: Range) = {
  val p1 = r1.head * r2.head
  val p2 = r1.head * r2.end
  val p3 = r1.end  * r2.head
  val p4 = r1.end  * r2.end
  val newHead = List(p1, p2, p3, p4).min
  val newEnd  = List(p1, p2, p3, p4).max
  newHead to newEnd
}

def subRanges(r1: Range, r2: Range) = {
  val newHead = r2.head - r1.head
  val newEnd  = r2.end  - r1.end
  newHead to newEnd
}

def rangeWidth(r: Range): Double = {
  (r.end - r.head) / 2.0
}

def output() = {
  val r1 = 2 to 9
  val r2 = 3 to 5
  (r1, r2, 
   addRanges(r1, r2), 
   multRanges(r1, r2), 
   subRanges(r2, r1), 
   /* divRanges(r1, r2), */
   rangeWidth(r1))
}

/**
  * execute with
  * scala -i Ex2_07-10.scala -e "println(output)"
  * until I figure out a better way
  */


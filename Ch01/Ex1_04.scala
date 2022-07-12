/**
  * Ex1_04.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * Demonstrate an operator that is a compound expression
  * (i.e., not known at compile time).
  */

def aPlusAbsB(a: Int, b: Int) = {
  val op = (b > 0) match {
    case true  => (x: Int, y: Int) => x + y
    case false => (x: Int, y: Int) => x - y
  }
  op(a, b)
}

/**
  * execute with
  * scala -i Ex1_04.scala -e "println(aPlusAbsB(3, -4))"
  * until I figure out a better way
  */


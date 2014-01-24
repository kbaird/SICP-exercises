/**
  * Ex1_11.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * Define both recursive and iterative processes for f
  * (Exercise 1.11)
  */

def fRec(n: Int): Int = {
  (n < 3) match {
    case true  => n
    case false => fRec(n-1) + (fRec(n-2)) * 2 + (fRec(n-3)) * 3
  }
}

def fIter(n: Int) = {
  def fInnerIter(n: Int, total: Int): Int = {
    (n < 3) match {
      case true => n + total
      case false => fInnerIter((n-1), total) +
        (fInnerIter((n-2), total) * 2) +
        (fInnerIter((n-3), total) * 3)
    }
  }
  fInnerIter(n, 0)
}

/**
  * execute with
  * scala -i Ex1_11.scala -e "println(fRec(4))"
  * scala -i Ex1_11.scala -e "println(fIter(4))"
  * until I figure out a better way
  */


/**
  * Ex1_10.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * Ackermann function
  * (Exercise 1.10)
  */

def ackermann(x: Int, y: Int): Int = {
  y match {
    case 0 => 0
    case _ => x match {
      case 0 => y * 2
      case _ => if (y == 1) 2 else ackermann((x-1), ackermann(x, y-1))
    }
  }
}

/**
  * execute with
  * scala -i Ex1_10.scala -e "println(ackermann(1, 0))"
  * scala -i Ex1_10.scala -e "println(ackermann(0, 1))"
  * scala -i Ex1_10.scala -e "println(ackermann(2, 3))"
  * until I figure out a better way
  */


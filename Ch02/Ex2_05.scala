/**
  * Ex2_04.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * Represent pair (a,b) as 2 ** a * 3 ** b
  */

def cons(a: Int, b: Int): Int = { (2 ^ a) * (3 ^ b) }

def car(z: Int): Int          = {
  def innerCar(a: Int, b: Int): Int = {
    (a % 2) match {
      case 0 => innerCar((a / 2), (b + 1))
      case _ => b
    }
  }
  innerCar(z, 1)
}

def cdr(z: Int): Int          = {
  def innerCdr(a: Int, b: Int): Int = {
    (a % 3) match {
      case 0 => innerCdr((a / 3), (b + 1))
      case _ => b
    }
  }
  innerCdr(z, 1)
}

def output() = {
  val pair = cons(1, 2)
  val head = car(pair)
  val tail = cdr(pair)
  (head, tail)
}

/**
  * execute with
  * scala -i Ex2_05.scala -e "println(output)"
  * until I figure out a better way
  */

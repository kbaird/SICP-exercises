/**
  * Ex1_03.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * Write a function that takes 3 numbers as arguments and returns
  * the sum of the squares of the 2 largest arguments.
  */

def sumSquares2Largest(a: Int, b: Int, c: Int) = {
  def square(x: Int) = { x*x }
  val args           = Array(a, b, c)
  val lowest         = args.min
  val lowestSquare   = square(lowest)
  val squaresL       = args.map(square)
  val sums           = squaresL.sum
  sums - lowestSquare
}

/**
  * execute with
  * scala -i Ex1_03.scala -e "println(sumSquares2Largest(1, 3, -4))"
  * until I figure out a better way
  */

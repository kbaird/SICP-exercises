/**
  * Ex1_03.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * Write a function that takes 3 numbers as arguments and returns
  * the sum of the squares of the 2largest arguments.
  */

class Ex1_03(
) {
  def square(x: Int) = { x*x }

  def sumSquares2Largest(a: Int, b: Int, c: Int) = {
      var args         = Array(a, b, c)
      var lowest       = args.min
      var lowestSquare = square(lowest)
      var squaresL     = args.map(square)
      var sums         = squaresL.sum
    sums - lowestSquare
  }
}

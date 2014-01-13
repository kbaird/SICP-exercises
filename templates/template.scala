/**
  * ExX_X.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * Write a function that takes 3 numbers as arguments and returns
  * the sum of the squares of the 2 largest arguments.
  */

object ExX_X extends App {
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

/**
  * execute with
  * scala -i ExX_X.scala -e "println(ExX_X.fun(args))"
  * until I figure out a better way
  */

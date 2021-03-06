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
  var args           = Array(a, b, c)
  var lowest         = args.min
  var lowestSquare   = square(lowest)
  var squaresL       = args.map(square)
  var sums           = squaresL.sum
  sums - lowestSquare
}

/**
  * execute with
  * scala -i Ex1_03.scala -e "println(sumSquares2Largest(1, 3, -4))"
  * until I figure out a better way
  */

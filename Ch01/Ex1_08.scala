/**
  * Ex1_08.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * Calculate cube roots using Newton's Method
  * (Exercise 1.8)
  */

def cbrt(x: Double) = {
  def cbrtIter(guess: Double, x: Double): Double = {
    def improve(guess: Double, x: Double) = {
      (x / (square(guess)) + (2 * guess)) / 3.0
    }
    def goodEnough(guess: Double, x: Double) = {
      def cube(x: Double) = { x * x * x }
      val tolerance       = 0.001
      (math.abs((cube(guess)) - x)) < tolerance
    }
    def square(x: Double) = { x * x }
    goodEnough(guess, x) match {
      case true  => guess
      case false => cbrtIter(improve(guess, x), x)
    }
  }
  cbrtIter(1.0, x) /* TODO: figure out point-free */
}

/**
  * execute with
  * scala -i Ex1_08.scala -e "println(cbrt(2.0))"
  * until I figure out a better way
  */


/**
  * Ex1_07.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * Redefine the tolerance to be a certain fraction
  * of the guess, rather than a constant value.
  */

object NewtonSquare extends App {

  def sqrt(x: Double) = { sqrtIter(1.0, x) } /* TODO: figure out point-free */

  def improve(guess: Double, x: Double) = {
    (guess + (x / guess)) / 2.0
  }

  def goodEnough(guess: Double, x: Double) = {
    (math.abs((square(guess)) - x)) < tolerance(guess)
  }

  def square(x: Double) = { x * x }

  def tolerance(x: Double) = { x * 0.001 } /* TODO: figure out point-free */

  def sqrtIter(guess: Double, x: Double): Double = {
    goodEnough(guess, x) match {
      case true  => guess
      case false => sqrtIter(improve(guess, x), x)
    }
  }
}

/**
  * execute with
  * scala -i Ex1_07.scala -e "println(NewtonSquare.sqrt(2.0))"
  * until I figure out a better way
  */


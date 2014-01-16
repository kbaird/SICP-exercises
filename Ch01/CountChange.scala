/**
  * CountChange.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * Count the number of ways to make change
  * (Example from 1.2.2 - Tree Recursion)
  */

def countChange(amount: Int): Int = {
  def innerCountChange(amount: Int, kindsOfCoins: Int): Int = {
    def firstDenomination(cnt: Int) = {
      cnt match {
        case 1 => 1
        case 2 => 5
        case 3 => 10
        case 4 => 25
        case 5 => 50
      }
    }
    amount match {
      case 0 => 1
      case _ => 
        (amount < 0) match {
          case true => 0
          case _    =>
            kindsOfCoins match {
              case 0 => 0
              case _ => innerCountChange(amount, (kindsOfCoins-1)) +
                innerCountChange(amount-(firstDenomination(kindsOfCoins)), kindsOfCoins)
            }
      }
    }
  }
  innerCountChange(amount, 5)
}

/**
  * execute with
  * scala -i CountChange.scala -e "println(countChange(100))"
  * until I figure out a better way
  */


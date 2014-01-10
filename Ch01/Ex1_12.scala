/**
  * Ex1_10.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * Output Pascal's Triangle via a recursive process
  * (Exercise 1.12)
  */

object Ex1_12 extends App {

  def pascalsTriangle(rowNum: Int): Array[Int] = {
    def sumPairs(pairs: Array[Int]): Array[Int] = {
      pairs.length match {
        case 0 => Array()
        case 1 => pairs
        case 2 => Array(pairs.slice(0,0) + pairs.slice(1,1))
        case 3 => Array(pairs.slice(0,0) + pairs.slice(1,1)) ++ sumPairs(pairs.slice(1, pairs.length))
      }
    }
    val prevRow  = pascalsTriangle(rowNum-1)
    val prevSums = sumPairs(prevRow)
    rowNum match {
      case 0 => Array()
      case 1 => Array(1)
      case 2 => Array(1,1)
      case _ => Array(1) ++ prevSums ++ Array(1)
    }
  }

}

/**
  * execute with
  * scala -i Ex1_12.scala -e "println(Ex1_12.pascalsTriangle(4))"
  * until I figure out a better way
  */


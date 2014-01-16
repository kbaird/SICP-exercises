/**
  * Ex1_09.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * Define both a recursive and iterative process for addition
  * (Exercise 1.9)
  */

def inc(x: Int) = { x + 1 } /* TODO: figure out point-free */
def dec(x: Int) = { x - 1 } /* TODO: figure out point-free */

def rAdd(a: Int, b: Int): Int = {
  a match {
    case 0 => b
    case _ => inc(rAdd(dec(a), b))
  }
}
def iAdd(a: Int, b: Int): Int = {
  a match {
    case 0 => b
    case _ => iAdd(dec(a), inc(b))
  }
}

/**
  * execute with
  * scala -i Ex1_09.scala -e "println(rAdd(1,2) + iAdd(3,4))"
  * until I figure out a better way
  */


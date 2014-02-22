/**
  * Ex2_06.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * Church numerals
  */

type F = Any => Any

val zero = (f: F) => ((x: Any) => x)
val add1 = (n: F) => (f: F) => ((x: Any) => (f((n(f)(x))))
val plus = (n: F, m: F) => ((f: F) => ((x: Any) => (m(f)(n(f)(x)))))
val one  = (f: F) => ((x: Any) => f(x))
val two  = (f: F) => ((x: Any) => f(f(x)))

def churchEncode(n: Int) = {
  def innerEncode(f: F, n: Int, x: Any): Any = {
    n match {
      case 0 => x
      case _ => f(innerEncode(f, n, x))
    }
  }
  (f: F) => (x: Any) => innerEncode(f, n, x)
}

def output() = {
  "Not sure how to test this. It compiles with strong types, which isn't *nothing*..."
}

/**
  * execute with
  * scala -i Ex2_06.scala -e "println(output)"
  * until I figure out a better way
  */

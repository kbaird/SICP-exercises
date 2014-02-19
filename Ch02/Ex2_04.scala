/**
  * Ex2_04.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * cons, car, cdr
  */

def cons(x, y) = {
  (m) => m(x, y)
}

def car(z) = {
  z((p, q) => p)
}

def cdr(z) = {
  z((p, q) => q)
}

def output() = {
  val pair = cons(1.0, 2.0)
  (car(pair), cdr(pair))
}

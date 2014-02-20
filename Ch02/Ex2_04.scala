/**
  * Ex2_04.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * cons, car, cdr
  */

/* Element */
type E       = Any
type PairToE = (E,E)   => E
type Storage = PairToE => E

def cons(x: E, y: E): Storage = { (f: PairToE) => f(x, y) }
def car(f: Storage): E        = { f((p, q) => p) }
def cdr(f: Storage): E        = { f((p, q) => q) }

def output() = {
  val pair = cons(1.0, 'x')
  val head = car(pair)
  val tail = cdr(pair)
  (head, tail)
}

/**
  * execute with
  * scala -i Ex2_04.scala -e "println(output)"
  * until I figure out a better way
  */

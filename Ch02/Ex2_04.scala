/**
  * Ex2_04.scala
  * Kevin C. Baird
  * SICP in Scala (http://www.scala-lang.org/documentation/)
  *
  * cons, car, cdr
  */

/* Element */
type Element       = Any
type PairToElement = (Element,Element) => Element
type Storage       = PairToElement => Element

def cons(x: Element, y: Element): Storage = { (f: PairToElement) => f(x, y) }
def car(f: Storage): Element              = { f((p, q) => p) }
def cdr(f: Storage): Element              = { f((p, q) => q) }

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

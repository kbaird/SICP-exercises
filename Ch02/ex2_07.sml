(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 2.7 - Interval Arithmetic
*)

use "interval.sml";

val i1 = Interval.make(2, 9)
val i2 = Interval.make(3, 5)
val i3 = Interval.add(i1, i2)
val i4 = Interval.mult(i1, i2)
val i5 = Interval.sub(i1, i2)
(*
val w  = Interval.width(r1)
*)
val i6 = Interval.divide(i1, i1)
val i7 = Interval.divide(i3, i4)

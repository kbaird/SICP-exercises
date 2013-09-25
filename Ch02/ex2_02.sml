(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 2.2 - Represent line segments on a place.
*)

use "point.sml";
use "segment.sml";

val p1 = Point.make' {x=0.0, y=1.0}
val p2 = Point.make' {x=2.5, y=3.2}
val s1 = Segment.make(p1,p2)
val p3 = Segment.midPoint(s1)

(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 2.3 - Represent rectangles on a plane
*)

use "point.sml";
use "rectangle.sml";

val ul_pt = Point.make' {x=0.0, y=0.0}
val ur_pt = Point.make' {x=3.0, y=0.0}
val ll_pt = Point.make' {x=0.0, y=4.0}
val lr_pt = Point.make' {x=3.0, y=4.0}
val rect1 = Rectangle.make' {ul=ul_pt, ur=ur_pt, ll=ll_pt, lr=lr_pt}
val p     = Rectangle.perimeter(rect1)
val a     = Rectangle.area(rect1)

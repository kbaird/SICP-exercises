(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 2.3 - Represent rectangles on a plane
*)

use "ex2_02.sml";

signature RECTANGLE = sig
    structure Point   : POINT
    structure Segment : SEGMENT
    type rectangle
    val upperLeft:  rectangle -> Point.point
    val upperRight: rectangle -> Point.point
    val lowerLeft:  rectangle -> Point.point
    val lowerRight: rectangle -> Point.point
    (*
    val perimeter:  rectangle -> real
    val area:       rectangle -> real
    *)
    val make:       Point.point * Point.point * Point.point * Point.point -> rectangle
end

structure Rectangle : RECTANGLE = struct
    structure Point   = Point
    structure Segment = Segment
    type rectangle  = Point.point * Point.point * Point.point * Point.point

    fun upperLeft (ul, _, _, _)   = ul
    fun upperRight(_, ur, _, _)   = ur
    fun lowerLeft (_, _, ll, _)   = ll
    fun lowerRight(_, _, _, lr)   = lr
    (*
    fun perimeter(ul, ur, ll, lr) =
        let xDiff(pt1, pt2) = pt2.x - pt1.x
        let yDiff(pt1, pt2) = pt2.y - pt1.y
        let square(x)       = x * x
        let distance(pt1, pt2) =
            Math.sqrt(square(xDiff) + square(yDiff))
        in  (distance(ul, ur) + distance(ur, lr)) * 2
        end
    fun area(ul, ur, ll, lr) =
        let distance(pt1, pt2) =
            ((pt2.x - pt1.x) ** 2 + (pt2.y - pt1.y) ** 2) ** 0.5
        in  distance(ul, ur) * distance(ur, lr)
        end
*)

    fun make(ul, ur, ll, lr) = (ul, ur, ll, lr) : rectangle
end

val ul_pt = Point.make(0.0, 0.0)
val ur_pt = Point.make(3.0, 0.0)
val ll_pt = Point.make(0.0, 4.0)
val lr_pt = Point.make(3.0, 4.0)
val rect1 = Rectangle.make(ul_pt, ur_pt, ll_pt, lr_pt)
(*
val p     = Rectangle.perimeter(rect1)
val a     = Rectangle.area(rect1)
*)

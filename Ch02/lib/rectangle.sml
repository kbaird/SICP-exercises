(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 2.3 - Represent rectangles on a plane
*)

use "./lib/point.sml";

signature RECTANGLE = sig
    structure Point : POINT
    type rectangle
    val upperLeft:  rectangle -> Point.point
    val upperRight: rectangle -> Point.point
    val lowerLeft:  rectangle -> Point.point
    val lowerRight: rectangle -> Point.point
    val perimeter:  rectangle -> real
    val area:       rectangle -> real
    val make':    { ul:Point.point, ur:Point.point,
                    ll:Point.point, lr:Point.point } -> rectangle
end

structure Rectangle : RECTANGLE = struct
    structure Point = Point
    type rectangle  = Point.point * Point.point * Point.point * Point.point

    fun upperLeft (ul, _, _, _)   = ul
    fun upperRight(_, ur, _, _)   = ur
    fun lowerLeft (_, _, ll, _)   = ll
    fun lowerRight(_, _, _, lr)   = lr
    fun perimeter(ul, ur, ll, lr) =
        let
        fun xDiff(pt1, pt2)    = (Point.x(pt2) - Point.x(pt1)):real
        fun yDiff(pt1, pt2)    = (Point.y(pt2) - Point.y(pt1)):real
        fun square(x)          = x * x
        fun distance(pt1, pt2) =
            Math.sqrt(square(xDiff(pt1,pt2)) + square(yDiff(pt1, pt2)))
        in  (distance(ul, ur) + distance(ur, lr)) * 2.0
        end
    fun area(ul, ur, ll, lr) =
        let
        fun xDiff(pt1, pt2)    = (Point.x(pt2) - Point.x(pt1)):real
        fun yDiff(pt1, pt2)    = (Point.y(pt2) - Point.y(pt1)):real
        fun square(x)          = x * x
        fun distance(pt1, pt2) =
            Math.sqrt(square(xDiff(pt1,pt2)) + square(yDiff(pt1, pt2)))
        in  (distance(ul, ur) * distance(ur, lr))
        end

    fun make' {ul=ul, ur=ur, ll=ll, lr=lr} = (ul, ur, ll, lr) : rectangle
end


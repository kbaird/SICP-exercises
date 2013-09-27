(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 2.2 - Represent line segments on a place.
*)

use "./lib/point.sml";

signature SEGMENT = sig
    structure Point : POINT
    type segment
    val startPoint: segment -> Point.point
    val endPoint:   segment -> Point.point
    val midPoint:   segment -> Point.point
    val make:       Point.point * Point.point -> segment
end

structure Segment : SEGMENT = struct
    structure Point = Point
    type segment    = Point.point * Point.point

    fun startPoint(s, _)  = s
    fun endPoint(_,   e)  = e
    fun midPoint(segment) =
        let
            fun avg(x, y) = (x + y) / 2.0
            val startX    = Point.x(startPoint(segment))
            val startY    = Point.y(startPoint(segment))
            val endX      = Point.x(endPoint(segment))
            val endY      = Point.y(endPoint(segment))
            val midX      = avg(startX, endX)
            val midY      = avg(startY, endY)
        in  Point.make'   {x=midX, y=midY}
        end

    fun make(pt1, pt2) = (pt1, pt2) : segment
end


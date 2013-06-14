(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 2.2 - Represent line segments on a place.
*)

signature POINT = sig
    type point
    val x:    point -> real
    val y:    point -> real
    val make: real * real -> point
end

signature SEGMENT = sig
    structure Point : POINT
    type segment
    val startPoint: segment -> Point.point
    val endPoint:   segment -> Point.point
    val midPoint:   segment -> Point.point
    val make:       Point.point * Point.point -> segment
end

structure Point : POINT = struct
    type point = real * real

    fun x(x, _) = x;
    fun y(_, y) = y;

    fun make(x, y) = (x, y) : point;
end

structure Segment : SEGMENT = struct
    structure Point = Point
    type segment    = Point.point * Point.point

    fun startPoint(s, _)  = s;
    fun endPoint(_,   e)  = e;
    fun midPoint(segment) =
        let
            fun avg(x, y) = (x + y) / 2.0;
            val startX    = Point.x(startPoint(segment));
            val startY    = Point.y(startPoint(segment));
            val endX      = Point.x(endPoint(segment));
            val endY      = Point.y(endPoint(segment));
            val midX      = avg(startX, endX);
            val midY      = avg(startY, endY)
        in  Point.make(midX, midY)
        end

    fun make(pt1, pt2) = (pt1, pt2) : segment;
end

val p1 = Point.make(0.0,1.0);
val p2 = Point.make(2.5,3.2);
val s1 = Segment.make(p1,p2);
val p3 = Segment.midPoint(s1);

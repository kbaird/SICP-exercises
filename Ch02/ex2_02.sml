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
    val start_pt: segment -> Point.point
    val end_pt:   segment -> Point.point
    val mid_pt:   segment -> Point.point
    val make:     Point.point * Point.point -> segment
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

    fun start_pt(s, _)  = s;
    fun end_pt(_,   e)  = e;
    fun mid_pt(segment) =
        let
            fun avg(x, y) = (x + y) / 2.0;
            val start_x   = Point.x(start_pt(segment));
            val start_y   = Point.y(start_pt(segment));
            val end_x     = Point.x(end_pt(segment));
            val end_y     = Point.y(end_pt(segment));
            val mid_x     = avg(start_x, end_x);
            val mid_y     = avg(start_y, end_y)
        in
            Point.make(mid_x, mid_y)
        end

    fun make(pt1, pt2) = (pt1, pt2) : segment;
end

val p1 = Point.make(0.0,1.0);
val p2 = Point.make(2.5,3.2);
val s1 = Segment.make(p1,p2);
val p3 = Segment.mid_pt(s1);

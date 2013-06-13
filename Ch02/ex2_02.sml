(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 2.2 - Represent line segments on a place.
*)

signature POINT = sig
    type point
    val x_point:    point -> real
    val y_point:    point -> real
    val make_point: real * real -> point
end

signature SEGMENT = sig
    structure Point : POINT
    type segment
    val start_segment: segment -> Point.point
    val end_segment:   segment -> Point.point
    val make_segment:  Point.point * Point.point -> segment
end

structure Point : POINT = struct
    type point = real list

    fun x_point(point) = List.hd(point);
    fun y_point(point) = List.hd(List.tl(point));

    fun make_point(x, y) = [x, y] : point;
end

structure Segment : SEGMENT = struct
    structure Point = Point
    type segment    = Point.point list

    fun start_segment(segment) = List.hd(segment);
    fun end_segment(segment)   = List.hd(List.tl(segment));

    fun make_segment(pt1, pt2) = [pt1, pt2] : segment;
end

val p1 = Point.make_point(0.0,1.0);
val p2 = Point.make_point(2.5,3.2);
val s1 = Segment.make_segment(p1,p2);

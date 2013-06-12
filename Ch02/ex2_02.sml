(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 2.2 - Represent line segments on a place.
*)

signature POINT = sig
    type point
    val get_x:      point -> real
    val get_y:      point -> real
    val make_point: real * real -> point
end

structure Point :> POINT = struct
    type point = real list

    fun get_x(point) = List.hd(point);
    fun get_y(point) = List.hd(List.tl(point));

    fun make_point(x, y) = [x, y] : point;
end

signature SEGMENT = sig
    structure Point : POINT
    type point = Point.point
    type segment
    val get_start:    segment -> point
    val get_end:      segment -> point
    val make_segment: point * point -> segment
end

functor Segment (Point:POINT) :> SEGMENT = struct
    structure Point    = Point;
    (*
    sharing type point = Point.point
    *)
    type point         = Point.point
    type segment       = point list

    fun get_start(segment) = List.hd(segment);
    fun get_end(segment)   = List.hd(List.tl(segment));

    fun make_segment(pt1, pt2) = [pt1, pt2] : segment;
end

structure Segment = Segment(Point);
val p1 = Point.make_point(0.0,1.0);
val p2 = Point.make_point(2.5,3.2);
(*
val s1 = Segment.make_segment(p1,p2);
*)

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
    exception E;

    fun get_x(x::_) = x
      | get_x(_)    = raise E;

    fun get_y(_::y::[]) = y
      | get_y(_)        = raise E;

    fun make_point(x, y) = [x, y];
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
    exception E;

    fun get_start(start_pt::_) = start_pt
      | get_start(_)           = raise E;

    fun get_end(_::end_pt::[]) = end_pt
      | get_end(_)             = raise E;

    fun make_segment(pt1, pt2) = [pt1, pt2];
end

structure Segment = Segment(Point);
val p1 = Point.make_point(0.0,1.0);
val p2 = Point.make_point(2.5,3.2);
val s1 = Segment.make_segment(p1,p2);

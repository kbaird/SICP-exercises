(*
Kevin C. Baird
SICP in Standard ML:
    Exercise 2.2 - Represent line segments on a place.
*)

structure Point =
    struct
        exception E;

        fun get_x(x::_) = x
          | get_x(_)    = raise E;

        fun get_y(_::y::[]) = y
          | get_y(_)        = raise E;

        fun make_point(x, y) = [x, y];
    end;

structure Segment =
    struct
        exception E;

        fun get_start(x::_) = x
          | get_start(_)    = raise E;

        fun get_end(_::y::[]) = y
          | get_end(_)        = raise E;

        fun make_segment(x, y) = [x, y];
    end;


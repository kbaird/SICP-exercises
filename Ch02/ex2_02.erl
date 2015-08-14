-module(ex2_02).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.2 - Represent line segments on a plane.").
-export([make_point/2, make_segment/2, x_point/1, y_point/1, start_segment/1, end_segment/1, midpoint_segment/1]).
-record(point,   {x,y}).
-record(segment, {start_pt,end_pt}).

% creators
make_point(X, Y) -> #point{x=X,y=Y}.
make_segment({point, X1, Y1}, {point, X2, Y2}) ->
  #segment{start_pt=make_point(X1,Y1), end_pt=make_point(X2, Y2)}.

% extractors
x_point(P)          -> P#point.x.
y_point(P)          -> P#point.y.
start_segment(S)    -> S#segment.start_pt.
end_segment(S)      -> S#segment.end_pt.
midpoint_segment(S) ->
  X1 = S#segment.start_pt#point.x,
  Y1 = S#segment.start_pt#point.y,
  X2 = S#segment.end_pt#point.x,
  Y2 = S#segment.end_pt#point.y,
  make_point(average(X1,X2), average(Y1,Y2)).

% hidden helpers
average(X1, X2) -> (X1+X2) / 2.


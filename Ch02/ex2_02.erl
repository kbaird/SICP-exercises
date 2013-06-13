-module(ex2_02).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.2 - Represent line segments on a place.").
-export([make_point/2, make_segment/2, x_point/1, y_point/1, start_segment/1, end_segment/1, midpoint_segment/1]).

% creators
make_point(X, Y) -> {point, X, Y}.
make_segment({point, X1, Y1}, {point, X2, Y2}) ->
   {segment, {point, X1, Y1}, {point, X2, Y2}}.

% extractors
x_point({point, X, _}) -> X.
y_point({point, _, Y}) -> Y.
start_segment(   {segment, {point, X1, Y1}, {point, _X, _Y}}) -> {point, X1, Y1}.
end_segment(     {segment, {point, _X, _Y}, {point, X2, Y2}}) -> {point, X2, Y2}.
midpoint_segment({segment, {point, X1, Y1}, {point, X2, Y2}}) -> {point, average(X1,X2), average(Y1,Y2)}.

% hidden helpers
average(X1, X2) -> (X1+X2) / 2.


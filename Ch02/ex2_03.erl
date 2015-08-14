-module(ex2_03).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.3 - Represent rectangle on a plane.").
-export([make_rectangle/4, perimeter/1, area/1]).
-import(ex2_03, [make_point/2, x_point/1, y_point/1]).
-record(point,     {x,y}).
-record(rectangle, {ul,ur,ll,lr}).

% creators
make_rectangle({ul, X1, Y1}, {ur, X2, Y2}, {ll, X3, Y3}, {lr, X4, Y4}) ->
  #rectangle{ul=make_point(X1,Y1),ur=make_point(X2,Y2),ll=make_point(X3,Y3),lr=make_point(X4,Y4)}.

% extractors
area(R) ->
  (distance(R#rectangle.ul, R#rectangle.ur) *
   distance(R#rectangle.ur, R#rectangle.lr)).

perimeter(R) ->
  (distance(R#rectangle.ul, R#rectangle.ur) +
   distance(R#rectangle.ur, R#rectangle.lr)) * 2.0.

% hidden helpers
distance(P1, P2) ->
  math:sqrt(square(x_diff(P1, P2)) + square(y_diff(P1, P2))).
square(X) -> X * X.
x_diff(P1, P2) -> P2#point.x - P1#point.x.
y_diff(P1, P2) -> P2#point.y - P1#point.y.


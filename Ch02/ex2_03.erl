-module(ex2_03).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.3 - Represent rectangle on a plane.").
-export([make_rectangle/4, perimeter/1, area/1]).
-import(ex2_03, [make_point/2, x_point/1, y_point/1]).
-include_lib("records.hrl").

% creators
make_rectangle({ul, X1, Y1}, {ur, X2, Y2}, {ll, X3, Y3}, {lr, X4, Y4}) ->
  #rectangle{ul=make_point(X1,Y1),ur=make_point(X2,Y2),ll=make_point(X3,Y3),lr=make_point(X4,Y4)}.

% extractors
area(#rectangle{ul=UL,ur=UR,lr=LR}) ->
  (distance(UL, UR) * distance(UR, LR)).

perimeter(#rectangle{ul=UL,ur=UR,lr=LR}) ->
  (distance(UL, UR) + distance(UR, LR)) * 2.0.

% hidden helpers
distance(P1, P2) ->
  math:sqrt(square(x_diff(P1, P2)) + square(y_diff(P1, P2))).
square(X) -> X * X.
x_diff(#point{x=X1}, #point{x=X2}) -> X2 - X1.
y_diff(#point{y=Y1}, #point{y=Y2}) -> Y2 - Y1.


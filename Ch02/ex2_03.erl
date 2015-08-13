-module(ex2_03).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.3 - Represent rectangle on a plane.").
-export([make_rectangle/4, perimeter/1, area/1]).

% creators
make_rectangle({ul, X1, Y1}, {ur, X2, Y2}, {ll, X3, Y3}, {lr, X4, Y4}) ->
   {rectangle, {ul, X1, Y1}, {ur, X2, Y2}, {ll, X3, Y3}, {lr, X4, Y4}}.

% extractors
area({rectangle, {ul, Xul, Yul}, {ur, Xur, Yur}, _LlPoint, {lr, Xlr, Ylr}}) ->
  (distance({point, Xul, Yul}, {point, Xur, Yur}) *
   distance({point, Xur, Yur}, {point, Xlr, Ylr})).

perimeter({rectangle, {ul, Xul, Yul}, {ur, Xur, Yur}, _LlPoint, {lr, Xlr, Ylr}}) ->
  (distance({point, Xul, Yul}, {point, Xur, Yur}) +
   distance({point, Xur, Yur}, {point, Xlr, Ylr})) * 2.0.

% hidden helpers
distance(Pt1, Pt2) ->
  math:sqrt(square(x_diff(Pt1, Pt2)) + square(y_diff(Pt1, Pt2))).
square(X) -> X * X.
x_diff({point, X1, _ }, {point, X2, _ }) -> X2 - X1.
y_diff({point, _ , Y1}, {point, _ , Y2}) -> Y2 - Y1.


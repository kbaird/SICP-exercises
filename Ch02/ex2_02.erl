-module(ex2_02).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.2 - Represent line segments on a place.").
-compile(export_all).

% creators
make_point(X, Y) -> {point, X, Y}.
make_segment({point, X1, Y1}, {point, X2, Y2}) ->
   {segment, {point, X1, Y1}, {point, X2, Y2}}.

% extractors
x_point({point, X, _}) -> X.
y_point({point, _, Y}) -> Y.
start_segment({segment, {point, X, Y}, {point, _, _}}) -> {point, X, Y}.
end_segment(  {segment, {point, _, _}, {point, X, Y}}) -> {point, X, Y}.


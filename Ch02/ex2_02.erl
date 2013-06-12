-module(ex2_02).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.2 - Represent line segments on a place.").
-compile(export_all).

% creators
make_point(X, Y) -> {point, X, Y}.
make_segment({point, X1, Y1}, {point, X2, Y2}) ->
   {segment, {point, X1, Y1}, {point, X2, Y2}}.

% extractors
get_x({point, X, _}) -> X.
get_y({point, _, Y}) -> Y.
get_start({segment, {point, X, Y}, {point, _, _}}) -> {point, X, Y}.
get_end(  {segment, {point, _, _}, {point, X, Y}}) -> {point, X, Y}.


-module(ex2_06).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.6 - Church Numerals").
-export([church_encode/1]).

church_encode(N) ->
  fun(F) -> (fun(X) -> inner_encode(F, N, X) end) end.

% helpers
inner_encode(_, 0, X) -> X;
inner_encode(F, N, X) -> F(inner_encode(F, (N-1), X)).


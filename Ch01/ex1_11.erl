-module(ex1_11).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 1.11 - define both recursive and iterative processes").
-export([f_rec/1, f_iter/1]).

%% Recursive, simple recursion, no hidden function.
f_rec(N) when N < 3 -> N;
f_rec(N) -> 
  f_rec(N-1) + (f_rec(N-2) * 2) + (f_rec(N-3) * 3).

%% Iterative, delegates to helper function with greater arity.
f_iter(N) -> f_iter(N, 0).

%% HELPER FUNCTIONS

f_iter(N, Sum) when N < 3 -> N + Sum; 
f_iter(N, Sum) ->
  f_iter(N-1, Sum) + (f_iter(N-2, Sum) * 2) + (f_iter(N-3, Sum) * 3).


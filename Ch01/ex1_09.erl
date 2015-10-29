-module(ex1_09).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 1.9 - Define both recursive & iterative process for addition").
-export([inc/1, dec/1, recursive_add/2, iterative_add/2]).

inc(X) -> X + 1.
dec(X) -> X - 1.

recursive_add(0, B) -> B;
recursive_add(A, B) -> inc(recursive_add( dec(A), B ) ).

iterative_add(0, B) -> B;
iterative_add(A, B) -> iterative_add( dec(A), inc(B) ).


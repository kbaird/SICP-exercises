-module(ex1_09).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 1.9 - Define both recursive & iterative process for addition").
-compile(export_all).

inc(X) -> X + 1.
dec(X) -> X - 1.

recursive_add(0, B) -> B;
recursive_add(A, B) -> inc(recursive_add( dec(A), B ) ).

iterative_add(0, B) -> B;
iterative_add(A, B) -> iterative_add( dec(A), inc(B) ).


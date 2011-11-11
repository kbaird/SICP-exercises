-module(ex1_10).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Ackermann Function").
-compile(export_all).

ackermann(_, 0) -> 0;
ackermann(0, Y) -> Y * 2;
ackermann(_, 1) -> 2;
ackermann(X, Y) -> ackermann(X-1, ackermann(X, Y-1)).

f(N) -> ackermann(0, N). % x * 2
g(N) -> ackermann(1, N). % 2 ** x if x > 0; 0 if x == 0; error if x < 0
h(N) -> ackermann(2, N). % [0 2 4 16 65536] read at index x if 0 <= x <= 4; error otherwise
k(N) -> 5 * N * N.       % 5 n squared


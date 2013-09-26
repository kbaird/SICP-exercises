-module(ex2_04).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.4 - cons, car, cdr.").
-export([cons/2, car/1, cdr/1]).

cons(X, Y) -> fun(M) -> M(X, Y) end.
car(Z)     -> Z(fun(P, _) -> P end).
cdr(Z)     -> Z(fun(_, Q) -> Q end).

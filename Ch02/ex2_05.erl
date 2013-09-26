-module(ex2_05).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.5 - cons, car, cdr via 2 ** a * 3 ** b.").
-export([cons/2, car/1, cdr/1]).

cons(A, B) -> trunc(math:pow(2, A) * math:pow(3, B)).
car(Z)     -> car(Z, 0).
cdr(Z)     -> cdr(Z, 0).

% helpers
car(A, B) ->
  case A rem 2 of
    0 -> car((A div 2), (B+1));
    _ -> B
  end.

cdr(A, B) ->
  case A rem 3 of
    0 -> cdr((A div 3), (B+1));
    _ -> B
  end.


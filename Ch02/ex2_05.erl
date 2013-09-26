-module(ex2_05).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.5 - cons, car, cdr via 2 ** a * 3 ** b.").
-export([cons/2, car/1, cdr/1]).

cons(A, B) -> trunc(math:pow(2, A) * math:pow(3, B)).
car(Z)     -> extract(Z, 0, 2).
cdr(Z)     -> extract(Z, 0, 3).

% helpers
extract(Encoded, Candidate, Base) ->
  case (Encoded rem Base) of
    0 -> extract((Encoded div Base), (Candidate+1), Base);
    _ -> Candidate
  end.


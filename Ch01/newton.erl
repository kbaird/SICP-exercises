-module(newton).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 1.1.7 - Calculate square roots using Newton's method.").
-export([sqrt/1]).

sqrt(X) -> sqrt(1.0, X).

%% HELPER FUNCTIONS

sqrt(Guess, X) ->
  case good_enough(Guess, X) of
    true  -> Guess;
    false -> sqrt(improve(Guess, X), X)
  end.

good_enough(Guess, X) -> (abs(square(Guess) - X) < tolerance()).
improve(Guess, X)     -> average(Guess, (X/Guess)).

average(X, Y) -> (X + Y) / 2.0.
square(X)     -> X * X.
tolerance()   -> 0.001.


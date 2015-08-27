-module(ex1_08).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 1.8 - Calculate cube roots using Newton's method.").
-export([cbrt/1]).

cbrt(X) -> cbrt(1.0, X).

%% HELPER FUNCTIONS

cbrt(Guess, X) ->
  case good_enough(Guess, X) of
    true  -> Guess;
    false -> cbrt(improve(Guess, X), X)
  end.

good_enough(Guess, X) ->
  (abs(cube(Guess) - X) < tolerance()).

improve(Guess, X) ->
  (X / (square(Guess)) + (2 * Guess)) / 3.0.

square(X)   -> X * X.
cube(X)     -> X * X * X.
tolerance() -> 0.001.


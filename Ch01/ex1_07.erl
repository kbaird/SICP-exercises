-module(ex1_07).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Redefine tolerance to vary based on the guess, not constant value.").
-export([sqrt/1]).

sqrt(X) -> sqrt(1.0, X).

%% HELPER FUNCTIONS

sqrt(Guess, X) ->
    % calling a function within a guard expression seems to be
    % illegal, so we stick with a case here.
    case good_enough(Guess, X) of
        true  -> Guess;
        false -> sqrt(improve(Guess, X), X)
    end.

good_enough( Guess, X ) -> (abs(square(Guess) - X) < tolerance(X)).
improve(     Guess, X ) -> average(Guess, (X/Guess)).

average(X, Y) -> (X + Y) / 2.0.
square(X)     -> X * X.
tolerance(X)  -> X * 0.001.


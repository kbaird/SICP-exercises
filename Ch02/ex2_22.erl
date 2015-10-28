-module(ex2_22).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.22 - make square_list iterative.").
-export([square_list/1]).
-include_lib("eunit/include/eunit.hrl").

square_list(L) -> lists:reverse(square_list(L, [])).

% PRIVATE HELPER FUNCTIONS

square_list([], Answer)    -> Answer;
square_list([H|T], Answer) -> square_list(T, [square(H)|Answer]).

square(X) -> X * X.

%%% TESTS

sq_test() -> ?assert(square_list([0, 1, 2, 3, 4]) =:= [0, 1, 4, 9, 16]).

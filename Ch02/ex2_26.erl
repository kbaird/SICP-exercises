-module(ex2_26).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: 2.26 - playing with append/cons/list").
-export([append/2, cons/2, list/2]).
-include_lib("eunit/include/eunit.hrl").

append(L1, L2)  -> L1 ++ L2.
cons(L1, L2)    -> [ L1 | L2 ].
list(L1, L2)    -> [ L1, L2 ].

%%% TESTS

append_test() ->
    ?assert([1, 2, 3, 4, 5, 6] =:= append([1, 2, 3], [4, 5, 6])).

cons_test() ->
    ?assert([[1, 2, 3], 4, 5, 6] =:= cons([1, 2, 3], [4, 5, 6])).

list_test() ->
    ?assert([[1, 2, 3], [4, 5, 6]] =:= list([1, 2, 3], [4, 5, 6])).


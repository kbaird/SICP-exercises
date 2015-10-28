-module(ex2_17).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.17 - last_pair.").
-export([last_pair/1]).
-include_lib("eunit/include/eunit.hrl").

last_pair([X, Y])      -> [X, Y];
last_pair([_, X|Tail]) -> last_pair([X|Tail]).

%%% TESTS

pair_from_pair_test()  -> ?assert(last_pair([1, 2])    =:= [1, 2]).
pair_from_three_test() -> ?assert(last_pair([0, 1, 2]) =:= [1, 2]).

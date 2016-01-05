-module(ex2_23).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.23 - for each").
-export([for_each/2]).
-include_lib("eunit/include/eunit.hrl").

for_each(_Fun, [])     -> [];
for_each(Fun, [Hd|Tl]) ->
    Fun(Hd),
    for_each(Fun, Tl).

%%% TESTS

for_each_test() ->
    for_each(fun io:format/1, ["you", "should", "see", "this"]).


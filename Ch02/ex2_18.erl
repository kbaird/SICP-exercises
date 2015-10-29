-module(ex2_18).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.18 - reverse.").
-export([reverse/1]).
-include_lib("eunit/include/eunit.hrl").

reverse([])      -> [];
reverse([Hd|Tl]) -> reverse(Tl) ++ [Hd].

%%% TESTS

reverse_test() ->
    ?assert(reverse(lists:seq(0, 9)) =:=
                    [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]).


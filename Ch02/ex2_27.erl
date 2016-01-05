-module(ex2_27).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: 2.27 - deep reverse").
-export([deep_reverse/1]).
-include_lib("eunit/include/eunit.hrl").

deep_reverse([]) -> [];
deep_reverse([X]) -> [X];
deep_reverse([Hd | Tl]) ->
    deep_reverse(Tl) ++ deep_reverse(Hd);
deep_reverse(X) -> [X].

%%% TESTS

empty_test() ->
    ?assertEqual([], deep_reverse([])).

single_test() ->
    ?assertEqual([x], deep_reverse([x])).

simple_test() ->
    ?assertEqual([3, 2, 1], deep_reverse([1, 2, 3])).

%compound_test() ->
%    ?assertEqual([ [3, 2, 1], 6, 5, 4], deep_reverse([4, 5, 6, [1, 2, 3]])).


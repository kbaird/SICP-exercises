-module(ex2_20).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.20 - same_parity.").
-export([same_parity/1]).
-include_lib("eunit/include/eunit.hrl").

same_parity([Hd|Tl]) ->
    lists:all(same_parity_pred(Hd), Tl).

same_parity_pred(Hd) ->
    fun(X) -> (X rem 2) =:= (Hd rem 2) end.

%%% TESTS

all_even_test() -> ?assert(same_parity([0, 2, 4, 6, 8]) =:= true).
all_odd_test()  -> ?assert(same_parity([1, 3, 5, 7, 9]) =:= true).
mixed_test()    -> ?assert(same_parity([0, 1])          =:= false).

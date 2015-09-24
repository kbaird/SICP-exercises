-module(change_tests).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Count the number of ways to make change").

-include_lib("eunit/include/eunit.hrl").

basic_result_test() -> ?assertEqual(292, change:count(100)).
no_money_test()     -> ?assertEqual(1,   change:count(0)).

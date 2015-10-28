-module(ex2_21).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.21 - 2 versions of square_list.").
-export([square_list1/1, square_list2/1, square_list3/1]).
-include_lib("eunit/include/eunit.hrl").

square_list1([])      -> [];
square_list1([Hd|Tl]) -> [ Hd * Hd | square_list1(Tl)].

square_list2(Xs) -> lists:map(fun(X) -> X * X end, Xs).

% why not...
square_list3(Xs) -> [ X * X || X <- Xs ].

%%% TESTS

sq1_test() -> ?assert(square_list1([0,1,2,3,4]) =:= [0,1,4,9,16]).
sq2_test() -> ?assert(square_list2([0,1,2,3,4]) =:= [0,1,4,9,16]).
sq3_test() -> ?assert(square_list3([0,1,2,3,4]) =:= [0,1,4,9,16]).


-module(ex2_25).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.25 - car/cdr combinations that return 7").
-export([car/1, cdr/1, caar/1, cdaddr/1, cadadr/1]).
-include_lib("eunit/include/eunit.hrl").

car(L)      -> hd(L).
cdr(L)      -> tl(L).
caar(L)     -> car(car(L)).
cdaddr(L)   -> cdr(car(cdr(cdr(L)))).
cadadr(L)   -> car(cdr(car(cdr(L)))).

%%% TESTS

cdr_test()          -> 7 =:= cdr([1, 7]).
car_cdaddr_test()   -> 7 =:= car(cdaddr([1, 3, [5, 7], 9])).
caar_test()         -> 7 =:= caar([[7]]).
complex_test()      -> 7 =:= cadadr(cadadr(cadadr([1, [2, [3, [4, [5, [6, 7]]]]]]))).


-module(count_change).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Count the number of ways to make change").
-export([count_change/1]).
-include_lib("eunit/include/eunit.hrl").

% Assume US coinage (five types of coins), and call hidden cc() function.
count_change(Amount) -> cc(Amount, 5).

cc(0, _) -> 1; % There is only one (empty) way to make change for no money at all.
cc(_, 0) -> 0; % There is no way to make change when there are no coin types available.

cc(Amount, _) when (Amount < 0) -> 0; % There is no way to make change for a negative amount of money.

% In all other cases...
cc(Amount, Kinds_Of_Coins) ->
  cc(Amount, Kinds_Of_Coins - 1) +
  cc(Amount - first_denomination(Kinds_Of_Coins), Kinds_Of_Coins).

% Define the coinage set as a hidden function.
first_denomination(1) -> 1;
first_denomination(2) -> 5;
first_denomination(3) -> 10;
first_denomination(4) -> 25;
first_denomination(5) -> 50.

%% TESTS

basic_result_test() -> ?assertEqual(292, count_change(100)).

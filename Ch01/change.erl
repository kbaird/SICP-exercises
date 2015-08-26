-module(change).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Count the number of ways to make change").
-export([count/1, loop/0]).
-include_lib("eunit/include/eunit.hrl").

count(Amount) ->
  Pid = spawn(change, loop, []),
  Pid ! {self(), Amount, 5}, % Assume US coinage (five types of coins), and call hidden count/2, via loop.
  receive
    {Pid, Msg} ->
      Pid ! stop, % stop after one execution
      Msg
  end.

loop() ->
  receive
    {From, Amount, Kinds} ->
      From ! {self(), count(Amount, Kinds)},
      loop()
  end.

%% PRIVATE FUNCTIONS

count(0, _) -> 1; % There is only one (empty) way to make change for no money at all.
count(_, 0) -> 0; % There is no way to make change when there are no coin types available.

count(Amount, _) when (Amount < 0) -> 0; % There is no way to make change for a negative amount of money.

% In all other cases...
count(Amount, Kinds_Of_Coins) ->
  count(Amount, Kinds_Of_Coins - 1) +
  count(Amount - first_denomination(Kinds_Of_Coins), Kinds_Of_Coins).

% Define the coinage set as a hidden function.
first_denomination(1) -> 1;
first_denomination(2) -> 5;
first_denomination(3) -> 10;
first_denomination(4) -> 25;
first_denomination(5) -> 50.

%% TESTS

basic_result_test() -> ?assertEqual(292, change:count(100)).
no_money_test()     -> ?assertEqual(1,   change:count(0)).

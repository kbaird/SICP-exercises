-module(ex2_19).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.19 - count change with the coin set as arg").
-export([count/1, handle_call/3]).
-include_lib("eunit/include/eunit.hrl").

% OTP also expects these to be defined, but I am not using them yet
-export([code_change/3, handle_cast/2, handle_info/2, init/1, terminate/2]).

-behavior(gen_server).

-define(US_COINS, [50, 25, 10, 5, 1]).
-define(UK_COINS, [100, 50, 20, 10, 5, 1, 0.5]).

count(Amount) ->
    {InitArgs, Opts} = {[], []}, % http://www.erlang.org/doc/man/gen_server.html
    gen_server:start_link({local, ?MODULE}, ?MODULE, InitArgs, Opts),
    gen_server:call(?MODULE, {Amount, ?US_COINS}).

handle_call({Amount, Coins}, _From, _LoopData) ->
    {reply, count(Amount, Coins), not_used}.

% OTP also expects these to be defined, but I am not using them yet
code_change(_, _, _) -> {error,   not_implemented}.
handle_cast(_, _)    -> {noreply, not_implemented}.
handle_info(_, _)    -> {noreply, not_implemented}.
init(_)              -> {ok,      null}.
terminate(_, _)      -> {noreply, not_implemented}.

%% PRIVATE FUNCTIONS

count(0, _)  -> 1; % There is only one (empty) way to make change for no money at all.
count(_, []) -> 0; % There is no way to make change when there are no coin types available.

count(Amount, _) when (Amount < 0) -> 0; % There is no way to make change
                                         % for a negative amount of money.

% In all other cases...
count(Amount, [BiggestCoin|ReducedSet] = Coins) ->
    ReducedAmt = Amount - BiggestCoin,
    count(Amount, ReducedSet) + count(ReducedAmt, Coins).

%%% TESTS

basic_result_test() -> ?assertEqual(292, count(100)).
no_money_test()     -> ?assertEqual(1,   count(0)).

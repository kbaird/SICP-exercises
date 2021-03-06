-module(change).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Count the number of ways to make change").
-export([count/1, handle_call/3]).
-include_lib("eunit/include/eunit.hrl").

% OTP also expects these to be defined, but I am not using them yet
-export([code_change/3, handle_cast/2, handle_info/2, init/1, terminate/2]).

-behavior(gen_server).

count(Amount) ->
    {InitArgs, Opts} = {[], []}, % http://www.erlang.org/doc/man/gen_server.html
    gen_server:start_link({local, ?MODULE}, ?MODULE, InitArgs, Opts),
    gen_server:call(?MODULE, {Amount, default_distinct_coin_count()}).

handle_call({Amount, Kinds}, _From, _LoopData) ->
    {reply, count(Amount, Kinds), not_used}.

% OTP also expects these to be defined, but I am not using them yet
code_change(_, _, _) -> {error,   not_implemented}.
handle_cast(_, _)    -> {noreply, not_implemented}.
handle_info(_, _)    -> {noreply, not_implemented}.
init(_)              -> {ok,      null}.
terminate(_, _)      -> {noreply, not_implemented}.

%% PRIVATE FUNCTIONS

count(0, _) -> 1; % There is only one (empty) way to make change for no money at all.
count(_, 0) -> 0; % There is no way to make change when there are no coin types available.

count(Amount, _) when (Amount < 0) -> 0; % There is no way to make change
                                         % for a negative amount of money.

% In all other cases...
count(Amount, Kinds_Of_Coins) ->
    ReducedSet = Kinds_Of_Coins - 1,
    ReducedAmt = Amount - first_denomination(Kinds_Of_Coins),
    count(Amount, ReducedSet) + count(ReducedAmt, Kinds_Of_Coins).

% Define the coinage set as a hidden function.
% I would have probably called this largest_coin().
first_denomination(1) -> 1;
first_denomination(2) -> 5;
first_denomination(3) -> 10;
first_denomination(4) -> 25;
first_denomination(5) -> 50.

default_distinct_coin_count() -> 5.

%%% TESTS

basic_result_test() -> ?assertEqual(292, change:count(100)).
no_money_test()     -> ?assertEqual(1,   change:count(0)).

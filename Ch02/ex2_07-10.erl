-module(ex2_07).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.7-2.10 - Interval Arithmetic").
-export([add_interval/2, mult_interval/2, div_interval/2, make_interval/2, sub_interval/2, width/1]).

make_interval(Lower, Upper) -> {interval, Lower, Upper}.

add_interval(I1, I2)    -> make_interval(add_lower(I1, I2), add_upper(I1, I2)).

div_interval(I1, I2) ->
  case spans_zero(I1) of
    true  -> throw({badarg, "Can't divide when spanning zero."});
    false -> mult_interval(I1, recip(I2))
  end.

mult_interval(I1, I2)   -> make_interval(lists:min(products(I1, I2)), lists:max(products(I1, I2))).

sub_interval(I1, I2)    -> make_interval(sub_lower(I1, I2), sub_upper(I1, I2)).

width({interval, L, U}) -> (U - L) / 2.0.

% helper_methods
add_lower({interval, L1, _}, {interval, L2, _}) -> L1 + L2.
add_upper({interval, _, U1}, {interval, _, U2}) -> U1 + U2.

products({interval, L1, U1}, {interval, L2, U2}) ->
  [L1 * L2, L1 * U2, U1 * L2, U1 * U2].

recip({interval, L, U}) -> {interval, (1.0 / L), (1.0 / U)}.

spans_zero({interval, L, U}) ->
  ((L >= 0) and (U =< 0)) or
  ((L =< 0) and (U >= 0)).

sub_lower({interval, L1, _}, {interval, L2, _}) -> L1 - L2.
sub_upper({interval, _, U1}, {interval, _, U2}) -> U1 - U2.

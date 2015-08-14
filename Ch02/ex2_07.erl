-module(ex2_07).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.7-2.10 - Interval Arithmetic").
-export([add_interval/2, mult_interval/2, div_interval/2, make_interval/2, sub_interval/2, width/1]).
-record (interval, {lower,upper}).

make_interval(Lower, Upper) -> #interval{lower=Lower, upper=Upper}.

add_interval(I1, I2) -> make_interval(add_lower(I1, I2), add_upper(I1, I2)).

div_interval(I1, I2) ->
  case spans_zero(I1) of
    true  -> throw({badarg, "Can't divide when spanning zero."});
    false -> mult_interval(I1, recip(I2))
  end.

mult_interval(I1, I2) -> make_interval(lists:min(products(I1, I2)), lists:max(products(I1, I2))).

sub_interval(I1, I2)  -> make_interval(sub_lower(I1, I2), sub_upper(I1, I2)).

width(I) -> (I#interval.upper - I#interval.lower) / 2.0.

% helper_methods
add_lower(I1, I2) -> I1#interval.lower + I2#interval.lower.
add_upper(I1, I2) -> I1#interval.upper + I2#interval.upper.

products(I1, I2) ->
  L1 = I1#interval.lower,
  U1 = I1#interval.upper,
  L2 = I2#interval.lower,
  U2 = I2#interval.upper,
  [L1 * L2, L1 * U2, U1 * L2, U1 * U2].

recip(I) -> make_interval((1.0 / I#interval.lower), (1.0 / I#interval.upper)).

spans_zero(I) ->
  [L, U] = [I#interval.lower, I#interval.upper],
  ((L >= 0) and (U =< 0)) or
  ((L =< 0) and (U >= 0)).

sub_lower(I1, I2) -> I1#interval.lower - I2#interval.lower.
sub_upper(I1, I2) -> I1#interval.upper - I2#interval.upper.


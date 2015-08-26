-module(ex2_07).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.7-2.10 - Interval Arithmetic").
-export([add_interval/2, mult_interval/2, div_interval/2, make_interval/2, sub_interval/2, width/1]).
-include_lib("records.hrl").

make_interval(Lower, Upper) -> #interval{lower=Lower, upper=Upper}.

add_interval(I1, I2) -> make_interval(add_lower(I1, I2),
                                      add_upper(I1, I2)).

div_interval(I1, I2) ->
  case spans_zero(I1) of
    true  -> throw({badarith, "Can't divide when spanning zero."});
    false -> mult_interval(I1, recip(I2))
  end.

mult_interval(I1, I2) -> make_interval(lists:min(products(I1, I2)),
                                       lists:max(products(I1, I2))).

sub_interval(I1, I2)  -> make_interval(sub_lower(I1, I2),
                                       sub_upper(I1, I2)).

width(#interval{lower=Lower,upper=Upper}) -> (Upper - Lower) / 2.0.

% helper_methods
add_lower(#interval{lower=L1},
          #interval{lower=L2}) -> L1 + L2.

add_upper(#interval{upper=U1},
          #interval{upper=U2}) -> U1 + U2.

products(#interval{lower=L1,upper=U1},
         #interval{lower=L2,upper=U2}) ->
  [L1 * L2, L1 * U2, U1 * L2, U1 * U2].

recip(#interval{lower=Lower,upper=Upper}) ->
  make_interval((1.0 / Lower), (1.0 / Upper)).

spans_zero(#interval{lower=Lower,upper=Upper}) ->
  ((Lower >= 0) and (Upper =< 0)) or
  ((Lower =< 0) and (Upper >= 0)).

sub_lower(#interval{lower=L1},
          #interval{lower=L2}) -> L1 - L2.

sub_upper(#interval{upper=U1},
          #interval{upper=U2}) -> U1 - U2.

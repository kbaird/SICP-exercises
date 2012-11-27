-module(ex1_04).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Demonstrate an operator that is a compound procedure (i.e., not known at compile time).").
-export([a_plus_abs_b/2, a_plus_abs_b_alt/2]).

a_plus_abs_b(A, B) ->
  Op = case (B < 0) of
    true  -> (fun(X, Y) -> X - Y end);
    false -> (fun(X, Y) -> X + Y end)
  end,
  Op(A, B).

% I normally prefer pattern matching and when clauses in Erlang over case statements,
% but a case seemed the most straightforward way to do this particular task.

% However, we can delegate to a hidden helper that uses pattern matching easily enough.
a_plus_abs_b_alt(A, B) ->
  Op = get_op(B),
  Op(A, B).

%% HELPER FUNCTIONS

get_op(B) when B < 0 -> fun(X, Y) -> X - Y end;
get_op(_)            -> fun(X, Y) -> X + Y end.

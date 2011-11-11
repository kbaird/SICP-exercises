-module(XXX).
-author('Kevin C. Baird').
-purpose('XXX.').
-compile(export_all).

a_plus_abs_b(A, B) ->
  Op = case (B < 0) of
    false -> (fun(X, Y) -> X + Y end);
    true  -> (fun(X, Y) -> X - Y end)
  end,
  Op(A, B).


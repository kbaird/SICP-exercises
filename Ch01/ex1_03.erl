-module(ex1_03).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Write a function that takes 3 arguments and returns the sum of the squares of the 2 largest arguments.").
-compile(export_all).

sum_squares_2_largest(A, B, C) ->
  ArgsL    = [A, B, C],
  Lowest   = lists:min(ArgsL),
  Square   = fun(X) -> X * X end,
  SquaresL = lists:map(Square, ArgsL),
  lists:sum(SquaresL) - Square(Lowest).

% squaring all three args and then subtracting the square (again) of the lowest 
% is not the most computationally efficient way to do this, but I wanted to show 
% that it was functionally equivalent to the usual approach of selecting just the 
% two highest and then squaring.

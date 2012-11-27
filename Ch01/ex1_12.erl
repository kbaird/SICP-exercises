-module(ex1_12).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 1.12 - Output Pascal's Triangle via recursive process").
-export([pascals_triangle/1]).

pascals_triangle(0) -> [];
pascals_triangle(1) -> [1];
pascals_triangle(2) -> [1, 1];
pascals_triangle(Row_Num) ->
  [1] ++ summed_pairs(Row_Num) ++ [1].

%% HELPER FUNCTIONS

summed_pairs(Row_Num) ->
  Previous_Row = pascals_triangle(Row_Num-1),
  summed_pairs_from_list(Previous_Row).

summed_pairs_from_list([])    -> [];
summed_pairs_from_list([X])   -> [X];
summed_pairs_from_list([X,Y]) -> [X+Y];
summed_pairs_from_list([X,Y,Tail]) ->
  [X+Y] ++ summed_pairs_from_list([Y,Tail]).

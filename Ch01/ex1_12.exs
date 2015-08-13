# SICP in Erlang: Exercise 1.12 - Output Pascal's Triangle via recursive process

defmodule Ex1_12 do
  def pascals_triangle 0       do []     end
  def pascals_triangle 1       do [1]    end
  def pascals_triangle 2       do [1, 1] end
  def pascals_triangle row_num do
    [1] ++ summed_pairs(row_num) ++ [1]
  end

  # Private functions
  defp summed_pairs row_num do
    previous_row = pascals_triangle(row_num - 1)
    summed_pairs_from_list(previous_row)
  end

  defp summed_pairs_from_list []         do []    end
  defp summed_pairs_from_list [x]        do [x]   end
  defp summed_pairs_from_list [x,y]      do [x+y] end
  defp summed_pairs_from_list [x,y,tail] do
    [x+y] ++ summed_pairs_from_list([y, tail])
  end
end

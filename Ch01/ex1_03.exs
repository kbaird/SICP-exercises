# SICP in Elixir: Write a function that takes 3 arguments and 
# returns the sum of the squares of the 2 largest arguments.

defmodule Ex1_03 do
  def sum_squares_2_largest(a, b, c) do
    [_, x, y] = Enum.sort([a, b, c])
    square(x) + square(y)
  end

  # Private functions
  defp square(x), do: x * x
end

IO.puts(Ex1_03.sum_squares_2_largest(0, 1, 2))

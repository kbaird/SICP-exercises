# SICP in Elixir: Exercise 1.8 - Calculate cube roots using Newton's method.

defmodule Ex1_08 do

  @tolerance 0.001

  def cbrt(x), do: cbrt(1.0, x)

  # Private functions
  defp cbrt(guess, x) do
    if good_enough?(guess, x) do
      guess
    else
      cbrt(improve(guess, x), x)
    end
  end

  defp good_enough?(guess, x) do
    abs(cube(guess) - x) < @tolerance
  end

  defp improve(guess, x) do
    (x / square(guess) + 2 * guess) / 3.0
  end

  defp cube(x), do: x * x * x
  defp square(x), do: x * x
end

IO.puts(Ex1_08.cbrt(7))

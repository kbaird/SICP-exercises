# SICP in Elixir: Redefine tolerance to vary based on the guess,
# rather than being a constant value.

defmodule Ex1_07 do
  def sqrt(x), do: sqrt(1.0, x)

  # Private functions
  defp sqrt(guess, x) do
    case good_enough(guess, x) do
      true -> guess
      false -> sqrt(improve(guess, x), x)
    end
  end

  defp average(x, y) do
    (x + y) / 2.0
  end

  defp good_enough(guess, x) do
    abs(square(guess) - x) < tolerance(x)
  end

  defp improve(guess, x) do
    average(guess, x / guess)
  end

  defp square(x), do: x * x
  defp tolerance(x), do: x * 0.001
end

IO.puts(Ex1_07.sqrt(2))

# SICP in Erlang: Exercise 1.1.7 - Calculate square roots using Newton's method.

defmodule Newton do
  def sqrt(x) do sqrt(1.0, x) end

# Private functions
  defp sqrt guess, x do
    case good_enough(guess, x) do
      true  -> guess
      false -> sqrt(improve(guess, x), x)
    end
  end
  defp good_enough guess, x do
    (abs(square(guess) - x) < tolerance)
  end
  defp improve guess, x do
    average(guess, (x/guess))
  end
  defp average x, y do (x + y) / 2.0 end
  defp square x     do x * x         end
  defp tolerance    do 0.001         end
end

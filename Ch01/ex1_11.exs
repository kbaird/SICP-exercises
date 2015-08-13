# SICP in Erlang: Exercise 1.11 - define both recursive and iterative processes

defmodule Ex1_11 do
  # Recursive, simple recursion, no hidden function.
  def f_rec n do
    case (n < 3) do
      true  -> n
      false -> f_rec(n-1) +
              (f_rec(n-2) * 2) +
              (f_rec(n-3) * 3)
    end
  end

  # Iterative, delegates to helper function with greater arity.
  def f_iter n do f_iter(n, 0) end

  # Private functions
  defp f_iter n, sum do
    case (n < 3) do
      true  -> n + sum
      false -> f_iter(n-1, sum) +
              (f_iter(n-2, sum) * 2) +
              (f_iter(n-3, sum) * 3)
    end
  end
end


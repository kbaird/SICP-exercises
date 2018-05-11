# SICP in Elixir: Exercise 2.20 - same-parity filter

defmodule Parity do
  def same([hd | tl]) do
    [hd] ++ Enum.filter(tl, get_predicate(hd))
  end

  # Private functions
  defp even?(x), do: rem(x, 2) == 0

  defp get_predicate(model) do
    case even?(model) do
      true -> fn x -> even?(x) end
      false -> fn x -> odd?(x) end
    end
  end

  defp odd?(x), do: rem(x, 2) == 1
end

result = Parity.same([0, 1, 2, 3])
unless result == [0, 2], do: throw(result)

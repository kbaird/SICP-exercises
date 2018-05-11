# SICP in Elixir: Exercise 2.17 - reverse

defmodule MyLists do
  def reverse([]), do: []
  def reverse([x]), do: [x]
  def reverse([h | t]), do: reverse(t) ++ [h]
  # inefficient, but it works

  # Private functions
end

result = MyLists.reverse([0, 1, 2, 3])
unless result == [3, 2, 1, 0], do: throw(result)

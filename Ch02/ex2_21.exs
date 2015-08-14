# SICP in Elixir: Exercise 2.21 - Define 2 versions of square-list

defmodule MyLists do
  def square_via_map list do
    Enum.map(list, &(&1 * &1))
  end
  def square_via_lc list do
    for n <- list, do: n * n
  end
end

result = MyLists.square_via_map([0, 1, 2, 3])
unless result == [0, 1, 4, 9], do: throw result

result = MyLists.square_via_lc([0, 1, 2, 3])
unless result == [0, 1, 4, 9], do: throw result


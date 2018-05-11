# SICP in Elixir: Exercise 2.22 - Make square-list iterative

defmodule MyLists do
  def square(list) do
    iter(list, [])
    |> :lists.reverse()
  end

  # Private functions
  defp iter([], answer), do: answer

  defp iter([hd | tl], answer) do
    iter(tl, [hd * hd] ++ answer)
  end
end

result = MyLists.square([0, 1, 2, 3])
unless result == [0, 1, 4, 9], do: throw(result)

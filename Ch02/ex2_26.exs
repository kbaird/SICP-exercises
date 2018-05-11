# SICP in Elixir: Exercise 2.26 - playing with append/cons/list

defmodule Ex2_26 do
  def append(x, y), do: x ++ y
  def cons(x, y), do: [x | y]
  def list(x, y), do: [x, y]
end

x = [1, 2, 3]
y = [4, 5, 6]

result = Ex2_26.append(x, y)
unless result == [1, 2, 3, 4, 5, 6], do: throw(result)

result = Ex2_26.cons(x, y)
unless result == [[1, 2, 3], 4, 5, 6], do: throw(result)

result = Ex2_26.list(x, y)
unless result == [[1, 2, 3], [4, 5, 6]], do: throw(result)

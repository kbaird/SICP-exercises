# SICP in Elixir: Ackermann Function

defmodule Ex1_10 do
  def ackermann(_, 0), do: (0)
  def ackermann(_, 1), do: (2)
  def ackermann(0, y), do: (y * 2)
  def ackermann(x, y) do
    ackermann(x-1, ackermann(x, y-1))
  end
end

IO.puts Ex1_10.ackermann(0, 0)
IO.puts Ex1_10.ackermann(0, 1)
IO.puts Ex1_10.ackermann(0, 2)
IO.puts Ex1_10.ackermann(1, 2)

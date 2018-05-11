# SICP in Elixir: Demonstrate an operator that is a compound procedure
# (i.e., not known at compile time).").

defmodule Ex1_04 do
  def a_plus_abs_b(a, b) do
    op = get_op(b)
    op.(a, b)
  end

  defp get_op(b) do
    cond do
      b < 0 -> fn x, y -> x - y end
      true -> fn x, y -> x + y end
    end
  end
end

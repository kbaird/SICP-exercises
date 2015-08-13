# SICP in Elixir: Exercise 1.9 - Define both a recursive and iterative process for addition

defmodule Ex1_09 do
  def i_add(0, b) do b end
  def i_add(a, b) do
    i_add(dec(a), inc(b))
  end
  def r_add(0, b) do b end
  def r_add(a, b) do
    inc(r_add(dec(a), b))
  end

# Private functions
  defp dec x do x - 1 end
  defp inc x do x + 1 end
end


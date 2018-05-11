# SICP in Elixir: Exercise 2.6 - Church Numerals

defmodule Ex2_06 do
  def church_encode(n) do
    fn f -> fn x -> inner_encode(f, n, x) end end
  end

  # Private functions
  defp inner_encode(_, 0, x), do: x

  defp inner_encode(f, n, x) do
    f.(inner_encode(f, n - 1, x))
  end
end

Ex2_06.church_encode(15)

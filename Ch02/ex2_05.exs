# SICP in Elixir: Exercise 2.5 - cons, car, cdr via 2 ** a * 3 ** b

defmodule Ex2_05 do
  def cons(a, b) do
    trunc(:math.pow(2, a) * :math.pow(3, b))
  end

  def car(z) do
    extract(z, 0, 2)
  end

  def cdr(z) do
    extract(z, 0, 3)
  end

  # Private functions
  defp extract(encoded, candidate, base) do
    case rem(encoded, base) do
      0 -> extract(div(encoded, base), candidate + 1, base)
      _ -> candidate
    end
  end
end

list = Ex2_05.cons(1, 2)
IO.puts(Ex2_05.car(list))
IO.puts(Ex2_05.cdr(list))

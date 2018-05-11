# SICP in Elixir: Exercise 2.25 - car/cdr combinations that return 7

defmodule Ex2_25 do
  def car([head | _]), do: head
  def cdr([_ | tail]), do: tail

  def caar(list) do
    car(list)
    |> car
  end

  def cdaddr(list) do
    cdr(list)
    |> cdr
    |> car
    |> cdr
  end

  def cadadr(list) do
    cdr(list)
    |> car
    |> cdr
    |> car
  end
end

l1 = [1, 3, [5, 7], 9]
l2 = [[7]]
l3 = [1, [2, [3, [4, [5, [6, 7]]]]]]

result = Ex2_25.car(Ex2_25.cdaddr(l1))
unless result == 7, do: throw(result)

result = Ex2_25.caar(l2)
unless result == 7, do: throw(result)

result = Ex2_25.cadadr(Ex2_25.cadadr(Ex2_25.cadadr(l3)))
unless result == 7, do: throw(result)

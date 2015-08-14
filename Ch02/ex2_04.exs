# SICP in Elixir: Exercise 2.4 - cons, car, cdr

defmodule Ex2_04 do
  def cons x, y do
    fn(m) -> m.(x, y) end
  end
  def car z do
    z.(fn(p, _) -> p end)
  end
  def cdr z do
    z.(fn(_, q) -> q end)
  end
end

list = Ex2_04.cons(1,2)
IO.puts Ex2_04.car(list)
IO.puts Ex2_04.cdr(list)

# SICP in Elixir: Exercise 2.23 - for_each

defmodule Ex2_23 do
  def for_each(_, []),     do: true
  def for_each(f, [hd|tl]) do
    f.(hd)
    for_each(f, tl)
  end
end

Ex2_23.for_each(&(IO.puts(&1)), ["you", "should", "see", "this"])


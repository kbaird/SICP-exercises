# SICP in Elixir: Exercise 2.17 - last_pair

defmodule Pair do
  def last([]),       do: throw {:badarg, "Too few elements, minimum of 2."}
  def last([_]),      do: throw {:badarg, "Too few elements, minimum of 2."}
  def last([a, b]),   do: [a, b]
  def last([_|tail]), do: last tail

  # Private functions
end

IO.puts Pair.last([0, 1, 2, 3])


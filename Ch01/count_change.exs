# SICP in Elixir: Count the number of ways to make change

defmodule Change do
  def count(amount), do: count(amount, 5)

  # Private functions

  # There is only one (empty) way to make change for no money at all.
  defp count(0, _), do: 1
  # There is no way to make change when there are no coin types available.
  defp count(_, 0), do: 0
  # There is no way to make change for a negative amount of money.
  defp count(amount, _) when amount < 0, do: 0
  # in all other cases...
  defp count(amount, kinds_of_coins) do
    count(amount, kinds_of_coins - 1) +
      count(amount - first_denomination(kinds_of_coins), kinds_of_coins)
  end

  # Assume US coinage
  defp first_denomination(1), do: 1
  defp first_denomination(2), do: 5
  defp first_denomination(3), do: 10
  defp first_denomination(4), do: 25
  defp first_denomination(5), do: 50
end

IO.puts(Change.count(100))

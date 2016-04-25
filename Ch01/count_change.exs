# SICP in Elixir: Count the number of ways to make change

defmodule Change do

  # Assume US coinage
  @denomination_at %{ 1 => 1, 2 => 5, 3 => 10, 4 => 25, 5 => 50 }

  def count(amount) do
    count(amount, coin_type_count)
  end

# Private functions

  defp coin_type_count do
    @denomination_at |> Map.keys |> Enum.count
  end

  # There is only one (empty) way to make change for no money at all.
  defp count(0, _), do: 1
  # There is no way to make change when there are no coin types available.
  defp count(_, 0), do: 0
  # There is no way to make change for a negative amount of money.
  defp count(amount, _) when (amount < 0), do: 0
  # in all other cases...
  defp count(amount, kinds_of_coins) do
    count(amount, kinds_of_coins - 1) +
      count(amount - first_denomination(kinds_of_coins), kinds_of_coins)
  end
  defp first_denomination idx do
    @denomination_at[idx]
  end
end

IO.puts Change.count(100)

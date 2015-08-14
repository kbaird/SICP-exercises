# SICP in Elixir: Count the number of ways to make change

defmodule Change do
  @denomination_at %{ 1 => 1, 2 => 5, 3 => 10, 4 => 25, 5 => 50 }
  def count amount do
    # Assume US coinage (five types of coins), and call private function.
    count(amount, 5)
  end

# Private functions
  defp count 0, _ do
    1 # There is only one (empty) way to make change for no money at all.
  end
  defp count _, 0 do
    0 # There is no way to make change when there are no coin types available.
  end
  defp count(amount, _) when (amount < 0) do
    0 # There is no way to make change for a negative amount of money.
  end
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

# SICP in Elixir: Count the number of ways to make change

defmodule Change do
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
  defp first_denomination(1) do 1  end
  defp first_denomination(2) do 5  end
  defp first_denomination(3) do 10 end
  defp first_denomination(4) do 25 end
  defp first_denomination(5) do 50 end
end

IO.puts Change.count(100)

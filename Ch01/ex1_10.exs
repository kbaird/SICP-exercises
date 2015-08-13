# SICP in Elixir: Ackermann Function

defmodule Ex1_10 do
  def ackermann _, 0 do 0     end
  def ackermann _, 1 do 2     end
  def ackermann 0, y do y * 2 end
  def ackermann x, y do
    ackermann(x-1, ackermann(x, y-1))
  end
end


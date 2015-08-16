# SICP in Elixir: Exercise 2.27 - deep reverse

defmodule Ex2_27 do
  def deep_reverse([]),  do: []
  def deep_reverse([x]), do: [x]
  def deep_reverse([hd|tl]) do
    deep_reverse(tl) ++ deep_reverse(hd)
  end
  def deep_reverse(x),   do: [x]
end

x = [1, 2, 3]
y = [4, 5, 6, x]

result = Ex2_27.deep_reverse []
unless result == [], do: throw result

result = Ex2_27.deep_reverse [:a]
unless result == [:a], do: throw result

result = Ex2_27.deep_reverse x
unless result == [3, 2, 1], do: throw result

#result = Ex2_27.deep_reverse y
#unless result == [ [ 3, 2, 1 ], 6, 5, 4 ], do: throw result

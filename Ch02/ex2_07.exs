# SICP in Elixir: Exercise 2.7-2.10 - Interval Arithmetic

defmodule Interval do
  def new lower, upper do
    {:interval, lower, upper}
  end
  def add {:interval, l1, u1}, {:interval, l2, u2} do
    new(l1+l2, u1+u2)
  end
  def div i1, i2 do
    case spans_zero?(i1) do
      true  -> throw({:badarg, "Can't divide when spanning zero."})
      false -> mult(i1, recip(i2))
    end
  end
  def mult i1, i2 do
    new(:lists.min(products(i1, i2)),
        :lists.max(products(i1, i2)))
  end
  def sub i1, i2 do
    new(sub_lower(i1, i2), sub_upper(i1, i2))
  end
  def width {:interval, lower, upper} do
    (upper - lower) / 2.0
  end

  # Private functions
  def products {:interval, l1, u1}, {:interval, l2, u2} do
    [l1 * l2, l1 * u2, u1 * l2, u1 * u2]
  end
  def recip {:interval, lower, upper} do
    new(1.0 / lower, 1.0 / upper)
  end
  defp spans_zero? {:interval, lower, upper} do
    ((lower >= 0) and (upper <= 0)) or
    ((lower <= 0) and (upper >= 0))
  end
  defp sub_lower {:interval, l1, _}, {:interval, l2, _} do
    l1 - l2
  end
  defp sub_upper {:interval, _, u1}, {:interval, _, u2} do
    u1 - u2
  end
end

i1 = Interval.new(1,5)
i2 = Interval.new(3,4)
i3 = Interval.add(i1, i2)
i4 = Interval.div(i1, i2)
i5 = Interval.sub(i3, i4)
IO.puts Interval.width(i5)
IO.puts Interval.width(i1)

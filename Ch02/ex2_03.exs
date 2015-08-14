# SICP in Erlang: Exercise 2.3 - Represent rectangle on a plane

defmodule Point do
  def new(x, y), do: {:point, x, y}
  def distance pt1, pt2 do
    :math.sqrt(square(diff(:x, pt1, pt2)) +
               square(diff(:y, pt1, pt2)))
  end
  def x({:point, x, _}), do: x
  def y({:point, _, y}), do: y

# Private functions
  defp square(x), do: x * x
  defp diff :x, {:point, x1, _}, {:point, x2, _} do
    x2 - x1
  end
  defp diff :y, {:point, _, y1}, {:point, _, y2} do
    y2 - y1
  end
end

defmodule Rectangle do
  def new {:point, x1, y1},
          {:point, x2, y2},
          {:point, x3, y3},
          {:point, x4, y4} do
    {:rectangle, {:point, x1, y1},
                 {:point, x2, y2},
                 {:point, x3, y3},
                 {:point, x4, y4}}
  end

  def area {:rectangle, ul, ur, _ll, lr} do
    Point.distance(ul, ur) * Point.distance(ur, lr)
  end

  def perimeter {:rectangle, ul, ur, _ll, lr} do
    (Point.distance(ul, ur) + Point.distance(ur, lr)) * 2.0
  end
end

ul = Point.new(1,10)
ur = Point.new(9,10)
ll = Point.new(1,4)
lr = Point.new(9,4)
r1 = Rectangle.new(ul, ur, ll, lr)
Rectangle.area(r1)
Rectangle.perimeter(r1)

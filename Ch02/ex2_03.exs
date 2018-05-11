# SICP in Elixir: Exercise 2.3 - Represent rectangle on a plane

defmodule Point do
  defstruct x: nil, y: nil
  def new(x, y), do: %Point{x: x, y: y}

  def distance(pt1, pt2) do
    :math.sqrt(square(diff(:x, pt1, pt2)) + square(diff(:y, pt1, pt2)))
  end

  # Private functions
  defp square(x), do: x * x

  defp diff(:x, %Point{x: x1}, %Point{x: x2}) do
    x2 - x1
  end

  defp diff(:y, %Point{y: y1}, %Point{y: y2}) do
    y2 - y1
  end
end

defmodule Rectangle do
  defstruct ul: nil, ur: nil, ll: nil, lr: nil

  def new(%Point{x: x1, y: y1}, %Point{x: x2, y: y2}, %Point{x: x3, y: y3}, %Point{x: x4, y: y4}) do
    %Rectangle{
      ul: %Point{x: x1, y: y1},
      ur: %Point{x: x2, y: y2},
      ll: %Point{x: x3, y: y3},
      lr: %Point{x: x4, y: y4}
    }
  end

  def area(%Rectangle{ul: ul, ur: ur, lr: lr}) do
    Point.distance(ul, ur) * Point.distance(ur, lr)
  end

  def perimeter(%Rectangle{ul: ul, ur: ur, lr: lr}) do
    (Point.distance(ul, ur) + Point.distance(ur, lr)) * 2.0
  end
end

ul = Point.new(1, 10)
ur = Point.new(9, 10)
ll = Point.new(1, 4)
lr = Point.new(9, 4)
r1 = Rectangle.new(ul, ur, ll, lr)
Rectangle.area(r1)
Rectangle.perimeter(r1)

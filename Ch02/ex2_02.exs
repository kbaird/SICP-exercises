# SICP in Elixir: Exercise 2.2 - Represent line segments on a plane

defmodule Point do
  defstruct x: nil, y: nil
  def new(x, y), do: %Point{x: x, y: y}
end

defmodule Segment do
  defstruct start_pt: nil, end_pt: nil

  def new(%Point{x: x1, y: y1}, %Point{x: x2, y: y2}) do
    %Segment{start_pt: Point.new(x1, y1), end_pt: Point.new(x2, y2)}
  end

  def mid_pt(%Segment{start_pt: start_pt, end_pt: end_pt}) do
    Point.new(average(start_pt.x, end_pt.x), average(start_pt.y, end_pt.y))
  end

  # Private functions
  defp average(x, y), do: (x + y) / 2
end

pt1 = Point.new(0, 0)
pt2 = Point.new(3, 4)
pt1.x
pt1.y
pt2.x
pt2.y

s1 = Segment.new(pt1, pt2)
s1.start_pt
s1.end_pt
Segment.mid_pt(s1)

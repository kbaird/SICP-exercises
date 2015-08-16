# SICP in Elixir: Exercise 2.2 - Represent line segments on a plane

defmodule Point do
  defstruct x: nil, y: nil
  def new(x, y), do: %Point{x: x, y: y}
end

defmodule Segment do
  def new %Point{x: x1, y: y1}, %Point{x: x2, y: y2} do
    {:segment, Point.new(x1, y1), Point.new(x2, y2)}
  end
  def start_pt {:segment, %Point{x: x1, y: y1}, _} do
    Point.new(x1, y1)
  end
  def end_pt {:segment, _, %Point{x: x1, y: y1}} do
    Point.new(x1, y1)
  end
  def mid_pt {:segment, %Point{x: x1, y: y1}, %Point{x: x2, y: y2}} do
    Point.new(average(x1,x2), average(y1,y2))
  end

  # Private functions
  defp average(x, y), do: (x + y) / 2
end

pt1 = Point.new(0,0)
pt2 = Point.new(3,4)
pt1.x
pt1.y
pt2.x
pt2.y

s1 = Segment.new(pt1, pt2)
Segment.start_pt(s1)
Segment.end_pt(s1)
Segment.mid_pt(s1)

# SICP in Erlang: Exercise 2.2 - Represent line segments on a plane

defmodule Point do
  def new(x, y), do: ({:point, x, y})
  def x({:point, x, _}), do: (x)
  def y({:point, _, y}), do: (y)
end

defmodule Segment do
  def new {:point, x1, y1}, {:point, x2, y2} do
    {:segment, Point.new(x1, y1), Point.new(x2, y2)}
  end
  def start_pt {:segment, {:point, x1, y1}, _} do
    Point.new(x1, y1)
  end
  def end_pt {:segment, _, {:point, x2, y2}} do
    Point.new(x2, y2)
  end
  def mid_pt {:segment, {:point, x1, y1}, {:point, x2, y2}} do
    Point.new(average(x1,x2), average(y1,y2))
  end

  # Private functions
  defp average(x, y), do: ((x + y) / 2)
end

pt1 = Point.new(0,0)
pt2 = Point.new(3,4)
Point.x(pt1)
Point.y(pt1)
Point.x(pt2)
Point.y(pt2)

s1 = Segment.new(pt1, pt2)
Segment.start_pt(s1)
Segment.end_pt(s1)
Segment.mid_pt(s1)

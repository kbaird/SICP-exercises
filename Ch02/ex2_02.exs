# SICP in Erlang: Exercise 2.2 - Represent line segments on a plane

defmodule Point do
  def new x, y do {:point, x, y} end
  def x {:point, x, _} do x end
  def y {:point, _, y} do y end
end

defmodule Segment do
  def new {:point, x1, y1}, {:point, x2, y2} do
    {:segment, {:point, x1, y1}, {:point, x2, y2}}
  end
  def start_pt {:segment, {:point, x1, y1}, _} do
    {:point, x1, y1}
  end
  def end_pt {:segment, _, {:point, x2, y2}} do
    {:point, x2, y2}
  end
  def mid_pt {:segment, {:point, x1, y1}, {:point, x2, y2}} do
    {:point, average(x1,x2), average(y1,y2)}
  end

  # Private functions
  defp average x, y do (x + y) / 2 end
end


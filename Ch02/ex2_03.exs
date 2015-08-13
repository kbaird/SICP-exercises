# SICP in Erlang: Exercise 2.3 - Represent rectangle on a plane

defmodule Point do
  def new x, y do {:point, x, y} end
  def distance pt1, pt2 do
    :math.sqrt(square(diff(:x, pt1, pt2)) +
               square(diff(:y, pt1, pt2)))
  end
  def x {:point, x, _} do x end
  def y {:point, _, y} do y end

# Private functions
  defp square x do x * x end
  defp diff :x, {:point, x1, _}, {:point, x2, _} do x2 - x1 end
  defp diff :y, {:point, _, y1}, {:point, _, y2} do y2 - y1 end
end

defmodule Rectangle do
  def new {:ul, {:point, x1, y1}},
          {:ur, {:point, x2, y2}},
          {:ll, {:point, x3, y3}},
          {:lr, {:point, x4, y4}} do
    {:rectangle, {:ul, {:point, x1, y1}}, 
                 {:ur, {:point, x2, y2}},
                 {:ll, {:point, x3, y3}},
                 {:rr, {:point, x4, y4}}}
  end

  def area {:rectangle, {:ul, ul}, {:ur, ur}, _ll, {:lr, lr}} do
    Point.distance(ul, ur) * Point.distance(ur, lr)
  end

  def perimeter {:rectangle, {:ul, ul_pt}, {:ur, ur_pt}, _ll, {:lr, lr_pt}} do
    (Point.distance(ul_pt, ur_pt) + Point.distance(ur_pt, lr_pt)) * 2.0
  end
end

ul = Point.new(1,10)
ur = Point.new(9,10)
ll = Point.new(1,4)
lr = Point.new(9,4)
r1 = Rectangle.new({:ul, ul}, {:ur, ur}, {:ll, ll}, {:lr, lr})
#Rectangle.area(r1)
#Rectangle.perimeter(r1)

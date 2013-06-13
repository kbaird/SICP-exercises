#!/usr/bin/env /ruby
# ex2_02.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Exercise 2.2 - Represent line segments on a plane

=end

class Point
  attr_accessor :x, :y
  def initialize(x, y)
    @x, @y = x, y
  end
end

class Segment
  attr_accessor :start_pt, :end_pt
  def initialize(start_pt, end_pt)
    @start_pt, @end_pt = start_pt, end_pt
  end
  def midpoint
    mid_x = average(start_pt.x, end_pt.x)
    mid_y = average(start_pt.y, end_pt.y)
    Point.new(mid_x, mid_y)
  end
  private
  def average(x1, x2)
    (x1 + x2) / 2.0
  end
end

if (__FILE__ == $0)
  pt1 = Point.new(0,0)
  pt2 = Point.new(3,4)
  s1  = Segment.new(pt1,pt2)
  puts s1.midpoint.inspect
end

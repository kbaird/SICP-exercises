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
end

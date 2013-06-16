#!/usr/bin/env /ruby
# ex2_03.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Exercise 2.3 - Represent rectangles on a plane
=end

require './ex2_02.rb'

class Rectangle

  SYMS = [:ul, :ur, :lr, :ll] unless defined?(self::SYMS)

  def initialize(points_hash)
    @points_hash = points_hash
  end

  def perimeter
    pairs.map { |pt1,pt2| distance(pt1,pt2) }.inject(&:+)
  end

  def area
    distance(@points_hash[:ul], @points_hash[:ur]) *
    distance(@points_hash[:ur], @points_hash[:lr])
  end

  private

  def pairs
    points.zip(points.rotate)
  end

  def points
    SYMS.map { |k| @points_hash[k] }
  end

  def distance(pt1, pt2)
    ((pt2.x - pt1.x) ** 2 + (pt2.y - pt1.y) ** 2) ** 0.5
  end
end

if (__FILE__ == $0)
  ul_pt = Point.new(0,0)
  ur_pt = Point.new(3,0)
  ll_pt = Point.new(0,-4)
  lr_pt = Point.new(3,-4)
  rect1 = Rectangle.new(ul: ul_pt, ur: ur_pt, ll: ll_pt, lr: lr_pt)
  puts "perimeter = #{rect1.perimeter}"
  puts "area = #{rect1.area}"
end

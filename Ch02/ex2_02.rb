#!/usr/bin/env /ruby
# ex2_02.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Exercise 2.2 - Represent line segments on a plane

=end

require 'rspec'

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

describe Segment do
  let(:pt1) { Point.new(0,0) }
  let(:pt2) { Point.new(3,4) }
  context "when given a 0,0 Point and a 3,4 Point" do
    subject { Segment.new(pt1, pt2) }
    its('midpoint.x') { should eq(1.5) }
    its('midpoint.y') { should eq(2.0) }
  end
end

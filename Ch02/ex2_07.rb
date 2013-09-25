#!/usr/bin/env /ruby
# ex2_07.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Exercise 2.7 - Interval Arithmetic
=end

class Range

  def +(other_range)
    new_first = (first + other_range.first)
    new_last  = (last  + other_range.last)
    new_first..new_last
  end

  def *(other_range)
    p1 = first * other_range.first
    p2 = first * other_range.last
    p3 = last  * other_range.first
    p4 = last  * other_range.last
    new_first = [p1, p2, p3, p4].min
    new_last  = [p1, p2, p3, p4].max
    new_first..new_last
  end

  def /(other_range)
    recip = (1.0 / other_range.last)..(1.0 / other_range.first)
    self * recip
  end

end


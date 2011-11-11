#!/usr/bin/env /ruby
# ex1_12.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Output Pascal's Triangle via a recursive process

Idiomatic Ruby is to add a method to a number ancestor
=end

module Precision

  BASE = [1]

  def pascals_triangle()
    return BASE * self if (self < 3)
    (BASE + summed_pairs + BASE)
  end

  private

  def summed_pairs
    output = []
    prev_row = (self-1).pascals_triangle
    prev_row.each_with_index do |item,idx|
      output << (item + prev_row[idx-1]) unless idx.zero?
    end
    output
  end

end

if (__FILE__ == $0)
  (0..9).to_a.each do |n|
    puts %Q[#{n}.pascals_triangle = #{n.pascals_triangle.inspect}]
  end
end


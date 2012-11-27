#!/usr/bin/env ruby
# ex1_03.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Write a function that takes 3 arguments and returns the
sum of the squares of the 2 largest arguments.
=end

def sum_squares_2_largest(a, b, c)
  args = [a, b, c]
  args.inject(0) do |m,e|
    m += (e ** 2); m
  end - args.min ** 2
end

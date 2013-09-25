#!/usr/bin/env /ruby
# ex2_06.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Exercise 2.6 - Church Numerals
=end

zero = ->(f) do
  ->(x) { x }
end

one = ->(f) do
  ->(x) { f[x] }
end

two = ->(f) do
  ->(x) { f[f[x]] }
end

church_encode = ->(n) do
  inner_encode = ->(f,n,x) do
    n.zero? ? x : f[inner_encode[f,n-1,x]]
  end
  ->(f) do
    ->(x) { inner_encode[f,n,x] }
  end
end

if __FILE__ == $0
end

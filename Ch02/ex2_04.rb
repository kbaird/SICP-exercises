#!/usr/bin/env /ruby
# ex2_04.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Exercise 2.4 - cons, car, cdr as lamba expressions
=end

cons = ->(x,y) do
  ->(m) { m[x,y] }
end

car = ->(z) do
  z[->(p,q) { p }]
end

cdr = ->(z) do
  z[->(p,q) { q }]
end

if __FILE__ == $0
  l = cons[1,2]
  puts car[l]
  puts cdr[l]
end

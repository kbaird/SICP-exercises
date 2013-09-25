#!/usr/bin/env /ruby
# ex2_04.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Exercise 2.4 - cons, car, cdr as lamba expressions
=end

cons = lambda do |x,y|
  lambda { |m| m.call(x,y) }
end

car = lambda do |z|
  z.call(lambda { |p,q| p })
end

cdr = lambda do |z|
  z.call(lambda { |p,q| q })
end

if __FILE__ == $0
  l = cons.call 1,2
  puts car.call l
  puts cdr.call l
end

#!/usr/bin/env /ruby
# ex2_04.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Exercise 2.4 - cons, car, cdr
=end

def cons(x,y)
  ->(m) { m[x,y] }
end

def car(z)
  z[->(p,q) { p }]
end

def cdr(z)
  z[->(p,q) { q }]
end

if __FILE__ == $0
  l = cons(1,2)
  puts [car(l), cdr(l)].inspect
end

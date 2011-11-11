#!/usr/bin/env ruby
# XXX.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
XXX
=end

def a_plus_abs_b(a, b)
  op = b > 0 ? :+ : :-
  a.send(op, b)
end

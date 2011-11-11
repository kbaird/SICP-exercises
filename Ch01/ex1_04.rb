#!/usr/bin/env ruby
# ex1_04.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Demonstrate an operator that is a compound expression
(i.e. not known at compile time).
=end

def a_plus_abs_b(a, b)
  op = b > 0 ? :+ : :-
  a.send(op, b)
end

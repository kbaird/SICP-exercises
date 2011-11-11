#!/usr/bin/env ruby
# ex1_05.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Test applicative-order ("evaluate args and then apply")
vs. 
normal-order ("fully expand and then reduce")
evaluation.
=end

RECIP = lambda { |x| 1.0/x }
IDENT = lambda { |x| x     }

def test_order(a, the_proc)
  return nil if a.zero?
  the_proc[a]
end

=begin
Applicative order exits early with the nil return guard, never calling SOURCE.
Normal order fully expands the call to SOURCE and then returns its value.
=end

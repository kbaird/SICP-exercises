#!/usr/bin/env /ruby
# ex1_10.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Ackermann function

Function rather than method for this one.
=end

def ackermann(x, y)
  return 0 if y == 0
  return y * 2 if x == 0
  return 2 if y == 1
  ackermann(x-1, ackermann(x, y-1))
end

def f(n); ackermann(0, n); end # -> x * 2
def g(n); ackermann(1, n); end # -> 2 ** x if x > 0; 0 if x == 0; error if x < 0
def h(n); ackermann(2, n); end # -> (0 2 4 16 65536) read at index x if 0 <= x <= 4; error otherwise
def k(n); 5 * n * n;       end # -> 5 n squared

if (__FILE__ == $0)
  puts %Q[ackermann(1, 10) = #{ackermann(1, 10)}]
  puts %Q[ackermann(2, 4)  = #{ackermann(2, 4)}]
  puts %Q[ackermann(3, 3)  = #{ackermann(3, 3)}]
  %w[f g h k].each do |func_name|
    puts %Q[#{func_name}(4) = #{send(func_name, 4)}]
  end
end

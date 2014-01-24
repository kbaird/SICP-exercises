#!/usr/bin/env /ruby
# ex1_10.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Ackermann function

Function rather than method for this one.
=end

require 'rspec'

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

describe "ackermann(1, 10)" do
  subject { ackermann(1, 10) }
  it { should eq(1024) }
end
describe "ackermann(2, 4)" do
  subject { ackermann(2, 4) }
  it { should eq(65536) }
end
describe "ackermann(3, 3)" do
  subject { ackermann(3, 3) }
  it { should eq(65536) }
end
describe "f(4)" do
  subject { f(4) }
  it { should eq(8) }
end
describe "g(4)" do
  subject { g(4) }
  it { should eq(16) }
end
describe "h(4)" do
  subject { h(4) }
  it { should eq(65536) }
end
describe "k(4)" do
  subject { k(4) }
  it { should eq(80) }
end


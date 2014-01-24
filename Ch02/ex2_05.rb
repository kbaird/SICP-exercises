#!/usr/bin/env /ruby
# ex2_05.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Exercise 2.5 - Represent pair (a,b) as 2 ** a * 3 ** b
=end

require 'rspec'

def cons(x,y)
  (2 ** x) * (3 ** y)
end

def car(z)
  extract(z, 0, 2)
end

def cdr(z)
  extract(z, 0, 3)
end

def extract(encoded, candidate, base)
  return candidate unless (encoded % base).zero?
  extract((encoded / base), (candidate+1), base)
end

describe "cons(1,2)" do
  let(:pair) { cons(1,2) }
  describe "car" do
    subject { car(pair) }
    it { should eq(1) }
  end
  describe "cdr" do
    subject { cdr(pair) }
    it { should eq(2) }
  end
end


#!/usr/bin/env /ruby
# ex2_04.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Exercise 2.4 - cons, car, cdr
=end

require 'rspec'

def cons(x,y)
  ->(m) { m[x,y] }
end

def car(z)
  z[->(p,q) { p }]
end

def cdr(z)
  z[->(p,q) { q }]
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


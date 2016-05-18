#!/usr/bin/env /ruby
# ex2_06.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Exercise 2.6 - Church Numerals
=end

require 'rspec'

_zero = ->(_f) do
  ->(x) { x }
end

_one = ->(f) do
  ->(x) { f[x] }
end

_two = ->(f) do
  ->(x) { f[f[x]] }
end

church_encode = ->(int) do
  inner_encode = ->(f,n,x) do
    n.zero? ? x : f[inner_encode[f,n-1,x]]
  end
  ->(f) do
    ->(x) { inner_encode[f,int,x] }
  end
end

describe "church encode" do
  context "(2)" do
    it "should be equivalent to pre-defined two" do
      pending {
        expect(church_encode.(2).(:arg).()).to eq(two.(:arg).())
      }
    end
  end
end

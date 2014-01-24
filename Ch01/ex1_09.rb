#!/usr/bin/env /ruby
# ex1_09.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Define both a recursive and iterative process for addition

Idiomatic Ruby is to add a method to some number ancestor
=end

require 'rspec'

class Fixnum

  def recursive_add(addend)
    return addend if self.zero?
    return dec.recursive_add(addend).succ
  end

  def iterative_add(addend)
    return addend if self.zero?
    return dec.iterative_add(addend.succ)
  end

  private

  def dec()
    self - 1
  end

end

describe Fixnum do
  describe "4.recursive_add(5)" do
    subject { 4.recursive_add(5) }
    it { should eq 4 + 5 }
  end
  describe "4.iterative_add(5)" do
    subject { 4.iterative_add(5) }
    it { should eq 4 + 5 }
  end
end


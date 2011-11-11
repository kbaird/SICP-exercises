#!/usr/bin/env /ruby
# count_change.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby

Idiomatic Ruby is to add a method to some number ancestor
=end

module Precision

  FIRST_DENOMINATION = [0, 1, 5, 10, 25, 50]

  def count_change(kinds_of_coins=5)
    # no way to make change under these conditions
    return 0 if ((self < 0) or kinds_of_coins.zero?) 
    
    # only one way to count no money at all
    return 1 if self.zero? 
    
    # otherwise proceed and recurse
    reduced_set_of_coins = self - FIRST_DENOMINATION[kinds_of_coins]
    count_change(kinds_of_coins-1) + reduced_set_of_coins.count_change(kinds_of_coins)
  end

end

if (__FILE__ == $0)
  require 'rubygems'
  require 'spec'
  describe "Precision#count_change" do
    it "should return 1 when called on zero with no argument" do
      0.count_change.should == 1
    end
    it "should return 0 when called on any number from -100 to -1 with no argument" do
      (-100..-1).to_a.all? { |n| n.count_change == 0 }.should be_true
    end
    it "should return 0 when called on any number from -100 to 100 with the argument 0" do
      (-100..100).to_a.all? { |n| n.count_change(0).zero? }.should be_true
    end
    it "should return 292 when called on 100 with no argument" do
      100.count_change.should == 292
    end
    it "should return 9 when called on 20 with no half-dollars available" do
      20.count_change(4).should == 9
    end
    it "should return 81 when called on 80 with no half-dollars or quarters available" do
      80.count_change(3).should == 81
    end
  end
end

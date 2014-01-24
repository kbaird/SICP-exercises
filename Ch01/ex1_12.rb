#!/usr/bin/env /ruby
# ex1_12.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Output Pascal's Triangle via a recursive process

Idiomatic Ruby is to add a method to a number ancestor
=end

require 'rspec'

class Integer

  BASE = [1]

  def pascals_triangle()
    return BASE * self if (self < 3)
    (BASE + summed_pairs + BASE)
  end

  private

  def summed_pairs
    output = []
    prev_row = (self-1).pascals_triangle
    prev_row.each_with_index do |item,idx|
      output << (item + prev_row[idx-1]) unless idx.zero?
    end
    output
  end

end

describe "0.f_pascals_triangle" do
  subject { 0.pascals_triangle }
  it { should eq([]) }
end

describe "1.f_pascals_triangle" do
  subject { 1.pascals_triangle }
  it { should eq([1]) }
end

describe "2.f_pascals_triangle" do
  subject { 2.pascals_triangle }
  it { should eq([1, 1]) }
end

describe "3.f_pascals_triangle" do
  subject { 3.pascals_triangle }
  it { should eq([1, 2, 1]) }
end

describe "4.f_pascals_triangle" do
  subject { 4.pascals_triangle }
  it { should eq([1, 3, 3, 1]) }
end

describe "5.f_pascals_triangle" do
  subject { 5.pascals_triangle }
  it { should eq([1, 4, 6, 4, 1]) }
end

describe "6.f_pascals_triangle" do
  subject { 6.pascals_triangle }
  it { should eq([1, 5, 10, 10, 5, 1]) }
end

describe "7.f_pascals_triangle" do
  subject { 7.pascals_triangle }
  it { should eq([1, 6, 15, 20, 15, 6, 1]) }
end

describe "8.f_pascals_triangle" do
  subject { 8.pascals_triangle }
  it { should eq([1, 7, 21, 35, 35, 21, 7, 1]) }
end

describe "9.f_pascals_triangle" do
  subject { 9.pascals_triangle }
  it { should eq([1, 8, 28, 56, 70, 56, 28, 8, 1]) }
end


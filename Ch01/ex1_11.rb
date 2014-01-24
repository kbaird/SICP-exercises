#!/usr/bin/env /ruby
# ex1_11.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Define recursive and iterative definitions of f

Idiomatic Ruby is to add a method to some number ancestor
=end

require 'rspec'

class Fixnum

  def f_rec()
    return self if (self < 3)
    (self-1).f_rec +
      ((self-2).f_rec * 2) +
      ((self-3).f_rec * 3)
  end

  def f_iter(sum=0)
    return (self+sum) if (self < 3)
    (self-1).f_iter(sum) +
      ((self-2).f_iter(sum) * 2) +
      ((self-3).f_iter(sum) * 3)

  end

end

(0..9).to_a.each do |n|
  describe "#{n}.f_rec" do
    subject { n.f_rec }
    it { should eq(n.f_iter) }
  end
end


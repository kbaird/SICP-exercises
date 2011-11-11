#!/usr/bin/env /ruby
# newton.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Calculate square roots using Newton's Method (Example 1.1.7)

Idiomatic Ruby is to add a method to some number ancestor
=end

module Precision

  TOLERANCE = 0.001

  def square()
    self ** 2
  end
  
  def sqrt()
    sqrt_iter(1.0)
  end

  private

  def good_enough?(guess)
    (guess.square - self).abs < TOLERANCE
  end

  def improve(guess)
    (guess + self/guess) / 2.0
  end

  def sqrt_iter(guess)
    return guess if good_enough?(guess)
    sqrt_iter(improve(guess))
  end

end

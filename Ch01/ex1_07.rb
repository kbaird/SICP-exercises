#!/usr/bin/env /ruby
# ex1_07.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Redefine the tolerance to be a certain fraction of the guess,
rather than a constant value.

Idiomatic Ruby is to add a method to some number ancestor
=end

module Precision

  BASE_TOLERANCE = 0.001

  def square()
    self ** 2
  end

  def sqrt()
    sqrt_iter(1.0)
  end

  private

  def good_enough?(guess)
    (guess.square - self).abs < tolerance(guess)
  end

  def improve(guess)
    (guess + self/guess) / 2.0
  end

  def sqrt_iter(guess)
    return guess if good_enough?(guess)
    sqrt_iter(improve(guess))
  end

  def tolerance(guess)
    guess * BASE_TOLERANCE
  end

end

#!/usr/bin/env /ruby
# ex1_08.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Calculate cube roots using Newton's Method (Exercise 1.8).

Idiomatic Ruby is to add a method to some number ancestor
=end

module Precision

  TOLERANCE = 0.001

  def cube();   self ** 3;      end
  def square(); self ** 2;      end
  def cbrt();   cbrt_iter(1.0); end

  private

  def good_enough?(guess)
    (guess.cube - self).abs < TOLERANCE
  end

  def improve(guess)
    (self / (guess.square) + (2 * guess)) / 3.0
  end

  def cbrt_iter(guess)
    return guess if good_enough?(guess)
    cbrt_iter(improve(guess))
  end

end

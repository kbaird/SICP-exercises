#!/usr/bin/env /ruby
# ex1_09.rb

=begin rdoc
Kevin C. Baird
SICP in Ruby
Define both a recursive and iterative process for addition

Idiomatic Ruby is to add a method to some number ancestor
=end

module Precision

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

if (__FILE__ == $0)
  puts %Q[4.recurive_add(5)  = #{4.recursive_add(5)}]
  puts %Q[4.iterative_add(5) = #{4.iterative_add(5)}]
end

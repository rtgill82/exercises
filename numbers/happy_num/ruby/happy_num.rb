#!/usr/bin/ruby
#
# Created:  Mon 05 Jun 2017 10:55:34 PM PDT
# Modified: Mon 05 Jun 2017 11:33:35 PM PDT
#
# Find the first 8 happy numbers
# Author: Robert Gill <locke@sdf.lonestar.org>
# Copyright 2017 (C) Robert Gill
#

class Integer
  def happy?
    num = self
    loop do
      num = sum_sqr_digits(num)
      break if num == 1 || num < 10
    end
    num == 1
  end

  private

  def sum_sqr_digits(num)
    sum = 0
    while num > 0
      digit = num % 10
      sum += digit * digit
      num /= 10
    end
    sum
  end
end

found = 0
2.step.each do |n|
  if n.happy?
    found += 1
    puts "#{n} is a Happy Number!"
  end
  break if found == 8
end

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

require 'benchmark'
require 'bigdecimal/math'

def sum_multiples_of_3_and_5_below(n)
  sum = 0
  (1...n).each do |number|
    if number % 3 == 0 || number % 5 == 0
      sum += number
    end
  end
  sum
end

def sum_multiples_of_3_and_5_below_v2(n)
  arr = (1...n).select { |number| number % 3 == 0 || number % 5 == 0 }
  arr.inject(0) { |sum,x| sum + x }
end

puts sum_multiples_of_3_and_5_below(1000)
puts sum_multiples_of_3_and_5_below_v2(1000)


# More efficient solution
TARGET = 1000
def sum_divisible_by(n)
  a = TARGET / n
  n * (a * (a + 1)) / 2
end

puts (sum_divisible_by(3) + sum_divisible_by(5) - sum_divisible_by(15))

Benchmark.bm do |bm|
  bm.report { sum_multiples_of_3_and_5_below(1000) }
  bm.report { sum_multiples_of_3_and_5_below_v2(1000 ) }
  bm.report { (sum_divisible_by(3) + sum_divisible_by(5) - sum_divisible_by(15)) }
end

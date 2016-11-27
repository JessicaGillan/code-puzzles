

def present_counter(house)
  factors = [house]

  (house/2).downto(1) do |divisor|
    factors << divisor if house%divisor == 0
  end

  factors.inject(:+) * 10
end

def first_house_with_at_least(input)
  house = 1
  loop do
    return house if present_counter(house) >= input
    house += 1
  end
end
#
# p first_house_with_at_least 3600000
#

# find prime factorization
# sum primes from exp 0 to exp in prime factorization
# multiply the sums = sum of factors!

require_relative './2015_1_prime_factorization.rb'
################### FIRST SOLUTION , LONG RUN TIME ########################
# def present_counter(house)
#   factors = [house]

#   (house/2).downto(1) do |divisor|
#     factors << divisor if house%divisor == 0
#   end

#   factors.inject(:+) * 10
# end

# def first_house_with_at_least(input)
#   house = 1
#   loop do
#     return house if present_counter(house) >= input
#     house += 1
#   end
# end

###########################################################################

# find prime factorization
# sum primes from exp 0 to exp in prime factorization
# multiply the sums = sum of factors

def find_prime_factorization(n)
  return [1] if n == 1

  quotient = n
  factors = []

  until quotient.is_prime?
    PrimeFactorization::primes.each do |prime|

      if quotient%prime == 0
        quotient = quotient / prime
        factors << prime
        break
      end
    end
  end

  factors << quotient
end

def sum_factors(prime_factorization)
  return 1 if prime_factorization == [1]

  counts = prime_factorization.each_with_object(Hash.new(0)) do |factor,counts|
                                counts[factor] += 1
                               end
  factor_sums = []
  counts.keys.each do |factor|
    sum = 0

    0.upto(counts[factor]) do |exp|
      sum += factor ** exp
    end

    factor_sums << sum
  end

  factor_sums.reduce(:*)
end

def present_counter_pf(house)
  sum_factors( find_prime_factorization(house) ) * 10
end

def first_house_with_at_least_pf(input)
  house = 1
  loop do
    return house if present_counter_pf(house) >= input
    house += 1
  end
end

def benchmark(n)
  # t = Time.now
  # (n/100).is_prime?
  # t1 = Time.now - t
  # puts "n.is_prime?: #{t1}"

  # t = Time.now
  # result = find_prime_factorization(n)
  # t2 = Time.now - t
  # puts "find_prime_factorization n: #{t2}"
  #
  # t = Time.now
  # sum_factors result
  # t3 = Time.now - t
  # puts "sum_factors result: #{t3}"
  #
  # sum = t2 + t3
  # puts "sum: #{sum}"

  t = Time.now
  p first_house_with_at_least_pf n
  puts "first_house_with_at_least_pf n: #{Time.now - t}"

  # puts "iterations*sum: #{iterations*sum}"
end

# 3 0s = 0.186s , pry 0.06
# 4 0s = 1.079s, 0.99 (10080) 1.69 (skip primes)
# 5 0s = 37.083s (90720) 59.422s (skip primes)
# 6 0s = ~ 57 min?
# present_counter_pf(90720) => 8.7 sec

# p first_house_with_at_least_pf 36000000
# 831600 # RIGHT ANSWER
# [Finished in 2318.606s]


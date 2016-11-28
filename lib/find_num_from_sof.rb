require_relative './2015_1_prime_factorization.rb'

def find_num_from_sof(sum_of_factors, prime_seed)
  sums, prime_seed_final = find_sums(sum_of_factors, prime_seed)
  factors = find_factors(sums, prime_seed_final)

  factors.reduce(:*)
end

def find_prime(sum, prime_seed)
  PrimeFactorization::prime_sums_of_powers_upto(prime_seed).each do |prime, sums_of_exp|
    if sums_of_exp.find_index(sum)
      return prime
    end
  end
end

def find_sums(sum_of_factors, prime_seed)
  sums = []
  q = sum_of_factors
  i = 0

  p list_of_sums = populate_list( prime_seed )

  loop do
    divided = true

    until (q < 3) || divided == false # list_of_sums.include?(q) ||
      divided = false

      i.upto(list_of_sums.length - 1) do |j|
        next if list_of_sums[j] == 1
        next if sums.include? list_of_sums[j]
        next if (q / list_of_sums[j]) == list_of_sums[j]
        next if sums.any?{ |sum| find_prime( sum, prime_seed) == find_prime( list_of_sums[j] , prime_seed )}

        if q%list_of_sums[j] == 0
          q = q / list_of_sums[j]
          sums << list_of_sums[j]
          divided = true
          break
        end
      end
    end
    sums << q

    break if sums.uniq.length == sums.length &&
             sums.all?{ |sum| list_of_sums.include? sum } &&
             sums.map{ |sum| find_prime(sum, prime_seed)}.uniq.length == sums.length

    if i = list_of_sums.find_index(sums[0])
      i += 1
    else
      i = 0
      prime_seed += 1
      list_of_sums = populate_list( prime_seed )
    end

    q = sum_of_factors
    sums = []
  end

  p sums
  p "prime_seed: #{prime_seed}"
  return sums, prime_seed
end

def find_factors(sums, prime_seed)
  sums.map do |sum|
    factor = nil

    PrimeFactorization::prime_sums_of_powers_upto(prime_seed).each do |prime, sums_of_exp|
      if exp = sums_of_exp.find_index(sum)
        p "prime: #{prime}"
        p "exp: #{exp}"
        factor = prime**exp
        break
      end
    end

    factor
  end
end

def populate_list( prime_seed )
  # # populate list of sums of powers up to 9
  PrimeFactorization::prime_sums_of_powers_upto(prime_seed).values.flatten.uniq.sort
end


#
# p find_sums(112, list_of_sums) #8,14 -> 91
# p find_num_from_sof(112, 1)
# # #
# p find_num_from_sof(91, 1) #7,13 -> 36
# #
# # # p find_sums(224, list_of_sums)
# p find_num_from_sof(224, 1) #4,7,8 (one answer) 84
# #
# p find_num_from_sof(3600, 1)# [6, 15, 40, 1] (1080)
#
# p find_num_from_sof(36000, 1) #
# [40, 60, 15]
# "prime_seed: 59"
# "prime: 3"
# "exp: 3"
# "prime: 59"
# "exp: 1"
# "prime: 2"
# "exp: 3"
# 12744

p find_num_from_sof(360000, 1) #60, 400, 15] 161896  (90720)
# [60, 400, 15]
# "prime_seed: 59"
# "prime: 59"
# "exp: 1"
# "prime: 7"
# "exp: 3"
# "prime: 2"
# "exp: 3"
# 161896
# [Finished in 31.447s]

# p find_num_from_sof(3600000, 1)
# [150, 400, 60]
# "prime_seed: 149"
# 3015313 !!!! Too high!!!

# 831600 CORRECT!!!!!!!!!

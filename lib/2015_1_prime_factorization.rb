module PrimeFactorization
  @@primes = [2]

  def self.primes
    @@primes
  end

  def self.prime_sums_of_powers_upto(number)
    prime_exp_sums = {}

    number.is_prime?
    
    PrimeFactorization::primes.each do |prime|
      break if prime > number

      prime_exp_sums[prime] = []
      0.upto(5) do |power|
        sum = 0

        0.upto(power) do |exp|
          sum += prime ** exp
        end

        prime_exp_sums[prime] << sum
      end
    end

    prime_exp_sums
  end

  def is_prime?
    return true if @@primes.include?(self)
    return false if self < @@primes.last

    # @@primes.each do |prime|
    #   return true if prime == self
    #   return false if self < prime
    # end

    # Populate @@primes as you find primes along
    # the way up to self
    is_prime = true
    (@@primes.last + 1).upto(self) do |n|
      is_prime = true

      @@primes.each do |divisor|
        if n%divisor == 0
          is_prime = false
          break
        end
      end

      @@primes << n if is_prime
    end

    is_prime
  end
end

class Fixnum
  include PrimeFactorization
end

class Bignum
  include PrimeFactorization
end

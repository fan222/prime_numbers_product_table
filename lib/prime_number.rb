class PrimeNumber
# The number of prime numbers below a given number n is approximately n/ln(n)
# For 64 digits integer, ln(n) is no larger than 45. To simplify calculation, 45
# is used to determine range of initial array.
  TIMES = 45
  attr_reader :primes

  def initialize(path)
    @primes = File.open(File.expand_path(path), 'r') do |f|
      f.each_line.map do |char|
        char.chomp.to_i
      end
    end
  end

  def get_prime_numbers(n)
    if n <= @primes.length
      [@primes[0...n], false]
    else
      diff = @primes.length
      [find_prime_numbers(n), true, diff]
    end
  end

  def find_prime_numbers(n)
    limit = n * 45
    numbers = Array.new(limit, true)
    primes = []

    (2..Math.sqrt(limit)).each do |i|
        if numbers[i]
          ((i**2)..limit).step(i) do |j|
            numbers[j] = false
          end
        end
    end

    idx = 2
    while primes.length < n && idx < numbers.length
      primes.push(idx) if numbers[idx]
      idx += 1
    end
    primes
  end
end

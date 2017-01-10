require 'prime_number'

describe 'PrimeNumber' do
  subject(:prime_number) { PrimeNumber.new('./spec/test.txt')}

  describe "#initialize" do
    it "read prime numbers in file" do
      expect(prime_number.primes).to eq([2,3,5])
    end
  end

  describe "#get_prime_numbers" do
    it "return n prime numbers" do
      expect(prime_number.get_prime_numbers(3)[0]).to eq([2,3,5])
    end

    it "return a false flag if n is less than the number of prime in file" do
      expect(prime_number.get_prime_numbers(2)[1]).to eq(false)
    end

    it "return a true flag if n is greater than the number of prime in file" do
      expect(prime_number.get_prime_numbers(4)[1]).to eq(true)
    end
  end

  describe "#find_prime_numbers" do
    it "return n prime numbers" do
      expect(prime_number.find_prime_numbers(4)).to eq([2,3,5,7])
    end
  end
end

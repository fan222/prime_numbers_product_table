require './lib/table'
require './lib/prime_number'

class NumberTable

  attr_reader :path
  def initialize(path = './lib/primes.txt')
    @path = path
  end

  def run
    puts "How many prime numbers' products table do you want to check? (default is 10)." + "\n"
    n = gets.chomp
    if n.empty?
      print_table(10)
    elsif n.to_i == 0
      puts "Please run program again and provide a valid number." + "\n"
    else
      print_table(n.to_i)
    end
  end

  def print_table(n)
    prime_number = PrimeNumber.new(@path)
    prime_and_flag = prime_number.get_prime_numbers(n)
    table = Table.new(prime_and_flag[0])
    puts table.make_products_table
    if prime_and_flag[1]
      diff = prime_and_flag[2]
      File.open(File.expand_path(@path), "a") do |f|
        f.puts(prime_and_flag[0][diff..-1])
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  number_table = NumberTable.new()
  number_table.run
end

# TODO: write test, aanswer fc questions, comment, update readme

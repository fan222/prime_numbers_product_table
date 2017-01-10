class Table
  attr_reader :primes

  def initialize(primes)
    @primes = primes
  end

  def make_products_table
    row_divider = make_row_divider
    row_header = make_row_header
    num_primes = @primes.length
    cell_length = largest_number_digit + 2

    table = row_divider
    table += row_header+ row_divider
    @primes.each_with_index do |prime1, idx|
      table += make_cell(prime1, cell_length)
      @primes.each_with_index do |prime2, idx|
        product = prime1 * prime2
        table += make_cell(product, cell_length)
      end
      table += "|" + row_divider
    end
    table
  end

  def make_cell(num, cell_length)
    "|" + " " + "#{num}" + " " * (cell_length - 1 - num.to_s.length)
  end

# using this number to dynamically determin the cell size
  def largest_number_digit
    (@primes.last ** 2).to_s.length
  end

  def make_row_divider
    cell_length = largest_number_digit + 2
    row_divider = "\n" + ("+" + "-"*cell_length) * (@primes.length + 1) + "+" + "\n"
    row_divider
  end

  def make_row_header
    cell_length = largest_number_digit + 2
    row_header = "|" + " " * cell_length
    @primes.each do |prime|
      row_header += make_cell(prime, cell_length)
    end
    row_header += "|"
    row_header
  end
end

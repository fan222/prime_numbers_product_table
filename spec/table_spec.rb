require 'table'

describe 'Table' do
  subject(:table) { Table.new([2,3,5])}

  describe "#initialize" do
    it "take an array of prime numbers" do
      expect(table.primes).to eq([2,3,5])
    end
  end

  describe "#largest_number_digit" do
    it "return the number of largest number's digit " do
      expect(table.largest_number_digit()).to eq(2)
    end
  end

  describe "#make_cell" do
    it "make one cell, with the same length and different cell element" do
      expect(table.make_cell(1, 4)).to eq("| 1  ")
    end
  end

  describe "#make_row_divider" do
    it "make row divider, the length depends on the input" do
      expect(table.make_row_divider).to eq("\n+----+----+----+----+\n")
    end
  end

  describe "#make_row_header" do
    it "make row header, the length depends on the input" do
      expect(table.make_row_header).to eq("|    | 2  | 3  | 5  |")
    end
  end

  describe "#make_products_table" do
    it "make a products table" do
      expect(table.make_products_table).to eq("\n+----+----+----+----+\n|    | 2  | 3  | 5  |\n+----+----+----+----+\n| 2  | 4  | 6  | 10 |\n+----+----+----+----+\n| 3  | 6  | 9  | 15 |\n+----+----+----+----+\n| 5  | 10 | 15 | 25 |\n+----+----+----+----+\n")
    end
  end
end

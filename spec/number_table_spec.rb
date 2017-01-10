path = File.expand_path('./number_table.rb')
require path

describe 'NumberTable' do
  subject(:number_table) { NumberTable.new('./spec/test.txt')}

  describe "#initialize" do
    it "read a file path" do
      expect(number_table.path).to eq('./spec/test.txt')
    end
  end

  describe "#print_table" do
    it "print a table" do
      output = "\n+---+---+\n|   | 2 |\n+---+---+\n| 2 | 4 |\n+---+---+\n"
      expect(STDOUT).to receive(:puts).with(output)
      number_table.print_table(1)
    end
  end
end

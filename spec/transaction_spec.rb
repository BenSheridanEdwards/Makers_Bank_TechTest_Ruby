require 'transaction'

describe Transaction do

  subject(:transaction) { Transaction.new }

  describe '#debit' do
    it 'receives the amount, date, and balance, then returns them in a hashed array' do
      expect(subject.debit(2000.00, "01/01/2020", 2000.00)).to eq([date: "01/01/2020", credit: nil, debit: 2000.00, balance: 2000.00])
    end
  end

  describe '#credit' do
    it 'receives the amount, date, and balance, then returns them in a hashed array' do
      expect(subject.credit(1000.00, "01/01/2020", 2000.00)).to eq([date: "01/01/2020", credit: 1000.00, debit: nil, balance: 2000.00])
    end
  end
end

require 'transaction'

describe Transaction do

  subject(:transaction) { Transaction.new }

  describe '#debit' do
    it 'receives the amount, date, and balance, and returns them in a hash' do
      expect(subject.debit(2000.00, "01/01/2020", 2000.00)).to eq([date: "01/01/2020", credit: nil, debit: 2000.00, balance: 2000.00])
    end
  end
end

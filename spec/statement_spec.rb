require 'statement'

describe Statement do

  subject(:statement) { Statement.new }
  let(:transaction) { double :transaction }

  describe '#add' do
    it 'adds deposit transactions to the transaction log' do
      allow(transaction).to receive(:debit).with(2000.00, "01/01/2020", 0.00).and_return([date: "01/01/2020", credit: nil, debit: 2000.00, balance: 0.00])
      deposit = transaction.debit(2000.00, "01/01/2020", 0.00)
      subject.add(deposit)
      expect(subject.transaction_log).to include deposit
    end

    it 'adds withdrawal transactions to the transaction log' do
      allow(transaction).to receive(:credit).with(1000.00, "01/01/2020", 1000.00).and_return([date: "01/01/2020", credit: 1000.00, debit: nil, balance: 1000.00])
      withdrawal = transaction.credit(1000.00, "01/01/2020", 1000.00)
      subject.add(withdrawal)
      expect(subject.transaction_log).to include withdrawal
    end
  end

  describe '#print' do
    before(:each) do
      allow(transaction).to receive(:debit).with(1000.00, "10/01/2012", 1000.00).and_return([date: "10/01/2012", credit: nil, debit: 1000.00, balance: 1000.00])
      allow(transaction).to receive(:debit).with(2000.00, "13/01/2012", 3000.00).and_return([date: "13/01/2012", credit: nil, debit: 2000.00, balance: 3000.00])
      allow(transaction).to receive(:credit).with(500.00, "14/01/2012", 2500.00).and_return([date: "14/01/2012", credit: 500.00, debit: nil, balance: 2500.00])
    end

    it 'prints out the transaction log in reverse chromological order' do
      deposit1 = transaction.debit(1000.00, "10/01/2012", 1000.00)
      subject.add(deposit1)
      deposit2 = transaction.debit(2000.00, "13/01/2012", 3000.00)
      subject.add(deposit2)
      withdrawal = transaction.credit(500.00, "14/01/2012", 2500.00)
      subject.add(withdrawal)
      expect(subject.print).to eq("date || credit || debit || balance\n14/01/2012 || 500.00 ||  || 2500.00\n13/01/2012 ||  || 2000.00 || 3000.00\n10/01/2012 ||  || 1000.00 || 1000.00")
    end
  end
end

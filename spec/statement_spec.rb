require 'statement'

describe Statement do

  subject(:statement) { Statement.new }

  describe '#add' do
    it 'adds deposit transactions to the transaction log' do
      statement.add(2000.00, "01/01/2020", 2000.00, "debit")
      expect(statement.log).to include({ date: "01/01/2020", credit: nil, debit: 2000.00, balance: 2000.00 })
    end

    it 'adds withdrawal transactions to the transaction log' do
      statement.add(2000.00, "01/01/2020", 1000.00, "credit")
      expect(statement.log).to include({ date: "01/01/2020", credit: 2000.00, debit: nil, balance: 1000.00 })
    end
  end

  describe '#print' do
    it 'prints out the statement with line breaks and in reverse chromological orderj' do
    end
  end

  describe '#log' do
    it 'returns the transaction log flattened and in reverse order' do
      statement.add(2000.00, "01/01/2020", 2000.00, "debit")
      statement.add(2000.00, "01/01/2020", 1000.00, "credit")
      expect(statement.log).to eq [{ date: "01/01/2020", credit: 2000.00, debit: nil, balance: 1000.00 }, { date: "01/01/2020", credit: nil, debit: 2000.00, balance: 2000.00 }]
    end
  end
end

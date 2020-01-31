require 'account'
require 'statement'

describe Account do

  let(:statement) { double :statement }
  subject(:account) { Account.new(statement) }

  describe '#deposit' do
    it 'increases the account balance by a given amount' do
      expect(account.balance).to eq(0.00)
      expect(statement).to receive(:add).with(2000.00, "01/01/2020", 2000.00, "debit")
      account.deposit(2000.00, "01/01/2020")
      expect(account.balance).to eq(2000.00)
    end

    it 'returns a summary of the tranaction' do
      expect(statement).to receive(:add).with(2000.00, "01/01/2020", 2000.00, "debit").and_return({ date: "01/01/2020", credit: nil, debit: 2000.00, balance: 2000.00 })
      expect(account.deposit(2000.00, "01/01/2020")).to eq({ date: "01/01/2020", credit: nil, debit: 2000.00, balance: 2000.00 })
    end

    it 'raises an error if the amount is 0 or below' do
      message = "Error: Please enter a positive amount"
      expect { account.deposit(0.00, "01/01/2020") }.to raise_error message
    end

    it 'raises an error if the date is an invalid format' do
      message = "Error: Invalid date, please use format DD/MM/YY"
      expect { account.deposit(1000.00, "2020-01-01") }.to raise_error message
    end
  end

  describe '#withdraw' do
    before(:each) do
      allow(statement).to receive(:add).with(1000.00, "01/01/2020", 1000.00, "debit")
      allow(statement).to receive(:add).with(500.00, "01/01/2020", 500.00, "credit")
    end

    it 'descreases the account balance by a given amount' do
      account.deposit(1000.00, "01/01/2020")
      expect(account.balance).to eq 1000.00
      account.withdraw(500.00, "01/01/2020")
      expect(account.balance).to eq 500.00
    end

    it 'raises an error if the amount is more than the available balance' do
      account.deposit(1000.00, "01/01/2020")
      message = "Error: Can't withdraw more than balance, 1000.00"
      expect { account.withdraw(1500.00, "01/01/2020") }.to raise_error message
    end

    it 'raises an error if the date is an invalid format' do
      account.deposit(1000.00, "01/01/2020")
      message = "Error: Invalid date, please use format DD/MM/YY"
      expect { account.withdraw(1000.00, "2020-01-01") }.to raise_error message
    end
  end
end

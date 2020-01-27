require 'account'

describe Account do

  let(:transaction) { double :transaction }
  let(:statement) { double :statement }
  subject(:account) { Account.new(transaction, statement) }

  it "Initializes with a zero balance, and returns it when called" do
    expect(subject.balance).to eq(0.00)
  end

  describe '#deposit' do
    
    before(:each) do
      allow(transaction).to receive(:debit).with(2000.00, "01/01/2020", 2000.00).and_return([date: "01/01/2020", credit: nil, debit: 2000.00, balance: 2000.00])
    end

    it 'increases the account balance by a given amount' do
      subject.deposit(2000.00, "01/01/2020")
      expect(subject.balance).to eq(2000.00)
    end

    it 'returns a summary of the tranaction' do
      expect(subject.deposit(2000.00, "01/01/2020")).to eq([date: "01/01/2020", credit: nil, debit: 2000.00, balance: 2000.00])
    end
  end

  describe '#withdraw' do
    before(:each) do
      allow(transaction).to receive(:debit).with(1000.00, "01/01/2020", 1000.00).and_return([date: "01/01/2020", credit: nil, debit: 2000.00, balance: 2000.00])
      allow(transaction).to receive(:credit).with(500.00, "01/01/2020", 500.00).and_return([date: "01/01/2020", credit: 500.00, debit: nil, balance: 500.00])
    end

    it 'descreases the account balance by a given amount' do
      account.deposit(1000.00, "01/01/2020")
      account.withdraw(500.00, "01/01/2020")
      expect(account.balance).to eq(500.00)
    end

    it 'returns a summary of the tranaction' do
      account.deposit(1000.00, "01/01/2020")
      expect(subject.withdraw(500.00, "01/01/2020")).to eq([date: "01/01/2020", credit: 500.00, debit: nil, balance: 500.00])
    end
  end

  context 'When a client starts their account with 1000.00, despoits 2000.00, then withdraws 500.00' do
    before(:each) do
      allow(transaction).to receive(:debit).with(1000.00, "01/01/2020", 1000.00).and_return([date: "01/01/2020", credit: nil, debit: 1000.00, balance: 1000.00])
      allow(transaction).to receive(:debit).with(2000.00, "01/01/2020", 3000.00).and_return([date: "01/01/2020", credit: nil, debit: 2000.00, balance: 3000.00])
      allow(transaction).to receive(:credit).with(500.00, "01/01/2020", 2500.00).and_return([date: "01/01/2020", credit: 500.00, debit: nil, balance: 2500.00])
    end
    
    it 'should return a remaining balance of 2500.00' do
      account.deposit(1000.00, "01/01/2020")
      account.deposit(2000.00, "01/01/2020")
      account.withdraw(500.00, "01/01/2020")
      expect(account.balance).to eq(2500.00)
    end
  end
end

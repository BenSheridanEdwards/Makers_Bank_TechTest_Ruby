require 'account'

describe Account do

  subject(:account) { Account.new }

  it "Initializes with a zero balance, and returns it when called" do
    expect(subject.balance).to eq(0.00)
  end

  describe '#deposit' do
    it 'increases the account balance by a given amount' do
      account.deposit(2000.00, "01/01/2020")
      expect(account.balance).to eq(2000.00)
    end

    # it 'returns a transaction detailing the date, tranaction type, amount and balance' do
    #   expect(account.deposit(2000, 01/01/2020)).to be_an_instance_of(Transaction)
    #   tranaction = account.deposit(2000.00, 01/01/2020)
    #   expect(transaction[:date]).to eq "01/01/2020"
    #   expect(transaction[:credit]).to eq nil
    #   expect(tranaction[:debit]).to eq "2000.00"
    #   expect(tranaction[:balance]).to eq "3000.00"
    # end
  end

  describe '#withdraw' do
    it 'descreases the account balance by a given amount' do
      account.deposit(1000.00, "01/01/2020")
      account.withdraw(500.00, "01/01/2020")
      expect(account.balance).to eq(500.00)
    end
  end

  context 'When a client starts their account with 1000.00, despoits 2000.00, then withdraws 500.00' do
    it 'should return a remaining balance of 2500.00' do
      account.deposit(2000.00, "01/01/2020")
      account.withdraw(500.00, "01/01/2020")
      expect(account.balance).to eq(1500.00)
    end
  end
end

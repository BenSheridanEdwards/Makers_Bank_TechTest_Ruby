require 'account'

describe Account do

  subject(:account) { Account.new(1000.00) }

  it "Initializes with a given starting balance, and returns it when called" do
    expect(account.balance).to eq(1000.00)
  end

  describe '#deposit' do
    it 'increases the account balance by a given amount' do
      account.deposit(2000)
      expect(account.balance).to eq(3000.00)
    end
  end

  describe '#withdraw' do
    it 'descreases the account balance by a given amount' do
      account.withdraw(500)
      expect(account.balance).to eq(2500.00)
    end
  end
end

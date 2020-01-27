require 'account'

describe Account do

  subject(:account) { Account.new(1000) }

  it "Initializes with a given starting balance, and returns it when called" do
    expect(account.balance).to eq(1000)
  end

  describe'#deposit' do
    it 'updates the account balance by a given amount' do
      account.deposit(2000)
      expect(account.balance).to eq(3000)
    end
  end
end

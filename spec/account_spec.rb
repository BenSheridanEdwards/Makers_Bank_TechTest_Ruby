require 'account'

describe Account do

  subject(:account) { Account.new(500) }

 it "Initializes with a given starting balance, and returns it when called" do
   expect(account.balance).to eq(500)
 end
end
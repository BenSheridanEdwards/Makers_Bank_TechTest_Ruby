class Account

  attr_reader :balance

  def initialize(balance = 500)
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
  end
end

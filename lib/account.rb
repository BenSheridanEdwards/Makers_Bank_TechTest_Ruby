class Account

  attr_reader :balance

  def initialize
    @balance = 0.00
  # @statement = Statement.new
  end

  def deposit(amount, date)
    @balance += amount
    @date = date
  end

  def withdraw(amount, date)
    @balance -= amount
    @date = date
  end
end

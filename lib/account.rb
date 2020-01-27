class Account

  attr_reader :balance

  def initialize(balance = 500)
    @balance = balance
  end
end
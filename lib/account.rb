class Account

  attr_reader :balance

  def initialize(transaction = Transaction.new, statement = Statement.new)
    @balance = 0.00
    @transaction = transaction
    @statement = statement
  end

  def deposit(amount, date)
    @balance += amount
    @date = date
    @statement.add(@transaction.debit(amount, "01/01/2020", @balance))
    return @transaction.debit(amount, "01/01/2020", @balance)
  end

  def withdraw(amount, date)
    @balance -= amount
    @date = date
    return @transaction.credit(amount, "01/01/2020", @balance)
  end
end

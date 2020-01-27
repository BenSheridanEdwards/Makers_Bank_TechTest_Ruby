class Account
  attr_reader :balance, :statement

  def initialize(transaction = Transaction.new, statement = Statement.new)
    @balance = 0.00
    @transaction = transaction
    @statement = statement
  end

  def deposit(amount, date)
    @balance += amount
    @date = date
    @statement.add(@transaction.debit(amount, date, @balance))
    return @transaction.debit(amount, date, @balance)
  end

  def withdraw(amount, date)
    @balance -= amount
    @date = date
    @statement.add(@transaction.credit(amount, date, @balance))
    return @transaction.credit(amount, date, @balance)
  end
end

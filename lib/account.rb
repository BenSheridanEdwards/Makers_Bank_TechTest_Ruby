class Account
  attr_reader :balance, :statement

  def initialize(transaction = Transaction.new, statement = Statement.new)
    @balance = 0.00
    @transaction = transaction
    @statement = statement
  end

  def deposit(amount, date)
    raise "Error: Please enter a positive amount" if not_positive(amount)

    @balance += amount
    @date = date
    @statement.add(@transaction.debit(amount, date, @balance))
    return @transaction.debit(amount, date, @balance)
  end

  def withdraw(amount, date = Time.now.strftime("%d/%m/%Y"))
    raise "Error: Can't withdraw more than balance, %<balance>.2f" % {
    balance: @balance } if balance_less_than(amount)

    @balance -= amount
    @date = date
    @statement.add(@transaction.credit(amount, date, @balance))
    return @transaction.credit(amount, date, @balance)
  end

  private 

  def not_positive(amount) 
    amount <= 0
  end

  def balance_less_than(amount)
    amount > @balance
  end
end

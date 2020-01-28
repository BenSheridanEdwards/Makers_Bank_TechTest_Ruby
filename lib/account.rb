class Account
  attr_reader :balance, :statement

  def initialize(transaction = Transaction.new, statement = Statement.new)
    @balance = 0.00
    @transaction = transaction
    @statement = statement
  end

  def deposit(amount, date)
    raise "Error: Please enter a positive amount" if amount_not_positive(amount)

    @balance += amount
    @date = date
    @statement.add(@transaction.debit(amount, date, @balance))
    return @transaction.debit(amount, date, @balance)
  end

  def withdraw(amount, date = Time.now.strftime("%d/%m/%Y"))
    @balance -= amount
    @date = date
    @statement.add(@transaction.credit(amount, date, @balance))
    return @transaction.credit(amount, date, @balance)
  end

  private 

  def amount_not_positive(amount) 
    amount <= 0
  end
end

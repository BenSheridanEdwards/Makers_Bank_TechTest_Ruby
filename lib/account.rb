require 'date'
require_relative './transaction'
require_relative './statement'

class Account
  attr_reader :balance, :statement

  def initialize(transaction = Transaction.new, statement = Statement.new)
    @balance = 0.00
    @transaction = transaction
    @statement = statement
  end

  def deposit(amount, date = Time.now.strftime("%d/%m/%Y"))
    raise "Error: Please enter a positive amount" if not_positive(amount)

    raise "Error: Invalid date, please use format DD/MM/YY" unless valid_date?(date)

    @balance += amount
    @statement.add(@transaction.debit(amount, date, @balance))
    return @transaction.debit(amount, date, @balance)
  end

  def withdraw(amount, date = Time.now.strftime("%d/%m/%Y"))
    raise "Error: Can't withdraw more than balance, %<balance>.2f" % {
    balance: @balance } if balance_less_than(amount)

    raise "Error: Please enter a positive amount" if not_positive(amount)

    raise "Error: Invalid date, please use format DD/MM/YY" unless valid_date?(date)
    
    @balance -= amount
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

  def valid_date?(date)
    date_format = '%d/%m/%Y'
    DateTime.strptime(date, date_format)
    true
    rescue ArgumentError
      false
  end
end

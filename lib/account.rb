require 'date'
require_relative './statement'

class Account

  def initialize(statement = Statement.new)
    @balance = 0.00
    @statement = statement
  end

  def deposit(amount, date = Time.now.strftime("%d/%m/%Y"))
    raise "Error: Please enter a positive amount" if not_positive(amount)

    raise "Error: Invalid date, please use format DD/MM/YY" unless valid_date?(date)

    @balance += amount
    @statement.add(amount, date, @balance, "debit")
  end

  def withdraw(amount, date = Time.now.strftime("%d/%m/%Y"))
    raise "Error: Can't withdraw more than balance, %<balance>.2f" % {
    balance: @balance } if balance_less_than(amount)

    raise "Error: Please enter a positive amount" if not_positive(amount)

    raise "Error: Invalid date, please use format DD/MM/YY" unless valid_date?(date)
    
    @balance -= amount
    @statement.add(amount, date, @balance, "credit")
  end

  def balance
    @balance.to_f
  end

  def print_statement
    @statement.print
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

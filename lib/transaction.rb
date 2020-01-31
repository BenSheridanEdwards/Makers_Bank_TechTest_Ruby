module Transaction

  def self.debit(amount, date, balance, statement)
    statement.add([date: date, credit: nil, debit: amount, balance: balance])
  end

  def self.credit(amount, date, balance, statement)
    statement.add([date: date, credit: amount, debit: nil, balance: balance])
  end
end

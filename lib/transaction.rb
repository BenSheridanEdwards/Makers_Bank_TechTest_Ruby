class Transaction

  def debit(amount, date, balance)

    return [date: date, credit: nil, debit: amount, balance: balance]
  end

  def credit(amount, date, balance)
    return [date: date, credit: amount, debit: nil, balance: balance]
  end
end

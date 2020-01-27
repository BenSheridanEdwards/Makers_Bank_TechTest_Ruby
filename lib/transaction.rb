class Transaction

  def debit(amount, date, balance)
    return [date: date, credit: nil, debit: amount, balance: balance]
  end

  
end

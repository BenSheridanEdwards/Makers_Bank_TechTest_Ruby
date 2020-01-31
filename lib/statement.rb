class Statement

  def initialize
    @transaction_log = []
  end

  def add(amount, date, balance, type)
    @transaction_log << deposit(amount, date, balance) if debit?(type)
    @transaction_log << withdraw(amount, date, balance) if credit?(type)
  end

  def print
    STDOUT.print "date || credit || debit || balance\n" << log.map { |transaction| 
      "%<date>s || %<credit>s || %<debit>s || %<balance>.2f" % {
        date: transaction[:date],
        credit: ("%.2f" % transaction[:credit] if transaction[:credit]),
        debit: ("%.2f" % transaction[:debit] if transaction[:debit]),
        balance: transaction[:balance]
      }
    }.join("\n")
  end

  def log
    @transaction_log.flatten.reverse
  end

  private

  def deposit(amount, date, balance)
    { date: date, credit: nil, debit: amount, balance: balance }
  end

  def withdraw(amount, date, balance)
    { date: date, credit: amount, debit: nil, balance: balance }
  end

  def debit?(type)
    type == "debit"
  end

  def credit?(type)
    type == "credit"
  end
end

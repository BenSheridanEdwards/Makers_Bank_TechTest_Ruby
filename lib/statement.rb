class Statement

  def initialize
    @transaction_log = []
  end

  def add(transaction)
    @transaction_log << transaction
  end

  def print
    STDOUT.print "date || credit || debit || balance\n" << statement.map { |transaction| 
      "%<date>s || %<credit>s || %<debit>s || %<balance>.2f" % {
        date: transaction[:date],
        credit: ("%.2f" % transaction[:credit] if transaction[:credit]),
        debit: ("%.2f" % transaction[:debit] if transaction[:debit]),
        balance: transaction[:balance]
      }
    }.join("\n")
  end

  private

  def statement
    @transaction_log.flatten.reverse
  end
end

class Statement
  attr_reader :transaction_log

  def initialize
    @transaction_log = []
  end

  def add(transaction)
    @transaction_log << transaction
  end

  def print
    return "date || credit || debit || balance\n" +
    @transaction_log.flatten.reverse.map do |transaction| 
      "%<date>s || %<credit>s || %<debit>s || %<balance>.2f" % {
      date: transaction[:date],
      credit: ("%.2f" % transaction[:credit] if transaction[:credit]),
      debit: ("%.2f" % transaction[:debit] if transaction[:debit]),
      balance: transaction[:balance]
    }
    end.join("\n")
  end
end

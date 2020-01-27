class Statement

  attr_reader :transaction_log

  def initialize
    @transaction_log = []
  end

  def add(transaction)
    @transaction_log << transaction
  end

  def print
    return "date || credit || debit || balance" + "\n" +
    @transaction_log.flatten.reverse.map { |transaction| "#{transaction[:date]} || #{"%.2f" % transaction[:credit] if transaction[:credit]} || #{"%.2f" % transaction[:debit] if transaction[:debit]} || #{"%.2f" % transaction[:balance]}" }.join("\n")
  end
end

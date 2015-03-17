module Demo
  class Account
    attr_reader :id, :currency, :initial_balance, :transactions

    def initialize(currency, initial_balance)
      @id = SecureRandom.uuid
      @currency = currency
      @initial_balance = initial_balance
      @transactions = []
    end

    def add_transaction(transaction)
      if @transactions.any? { |t| t.id == transaction.id }
        raise StandardError.new("Hodor?")
      end
      if transaction.account != self
        raise StandardError.new("Hodor!")
      end

      @transactions.push(transaction)
    end

    def get_balance
      amount = initial_balance + transactions.sum { |t| t.amount }
      return Money.new(amount, currency)
    end
  end
end
module Demo
  class Account
    attr_reader :id, :currency, :initial_balance, :transactions

    def initialize(currency, initial_balance)
      @id = SecureRandom.uuid
      @currency = currency
      @initial_balance = initial_balance
      @transactions = []
    end

    def balance
      amount = initial_balance + transactions.sum(&:amount)
      Money.new amount, currency
    end

    def add_transaction(transaction)
      raise StandardError.new "Hodor?" if @transactions.any? { |t| t.id == transaction.id }
      raise StandardError.new "Hodor!" if transaction.account != self
      @transactions.push transaction
    end
  end
end
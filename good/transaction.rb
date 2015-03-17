module Demo
  class Transaction
    include CurrencyConverter

    attr_reader :id, :account, :amount, :reference, :comment
    delegate :currency, to: :account

    def initialize(account, amount, comment)
      @id = SecureRandom.uuid
      @comment = comment
      @amount = amount
      @account = account
    end

    def assign_reference(transaction)
      @reference = transaction
    end
  end
end
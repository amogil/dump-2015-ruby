module Demo
  class Transaction
    attr_reader :id, :account, :amount, :reference, :comment

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
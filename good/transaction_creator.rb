module Demo
  class TransactionCreator
    def initialize(from, to)
      @from = from
      @to = to
    end

    def create(amount, comment)
      t1 = Transaction.new(@from, -amount.to(@from.currency), comment)
      t2 = Transaction.new(@to, amount.to(@to.currency), comment)
      t1.assign_reference(t2)
      t2.assign_reference(t1)
      @from.add_transaction(t1)
      @to.add_transaction(t2)
      [t1, t1]
    end
  end
end
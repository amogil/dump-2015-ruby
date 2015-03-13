module Demo
  class TransactionCreator
    def initialize(from, to, currency_converter)
      @from = from
      @to = to
      @currency_converter = currency_converter
    end

    def create(currency, amount, comment)
      minus_amount = @currency_converter.convert(currency, @from.currency, amount)
      plus_amount = @currency_converter.convert(currency, @to.currency, amount)
      t1 = Transaction.new(@from, -minus_amount, comment)
      t2 = Transaction.new(@to, plus_amount, comment)
      t1.assign_reference(t2)
      t2.assign_reference(t1)
      @from.add_transaction(t1)
      @to.add_transaction(t2)
      return [t1, t1]
    end
  end
end
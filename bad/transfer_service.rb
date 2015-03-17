module Demo
  class TransferService
    def initialize(currency_converter)
      @currency_converter = currency_converter
    end

    def transfer(from, to, money, comment)
      minus = @currency_converter.convert(money.currency, from.currency, money.amount)
      plus = @currency_converter.convert(money.currency, to.currency, money.amount)
      t1 = Transaction.new(from, -minus, comment)
      t2 = Transaction.new(to, plus, comment)
      t1.assign_reference(t2)
      t2.assign_reference(t1)
      from.add_transaction(t1)
      to.add_transaction(t2)
      return [t1, t1]
    end
  end
end
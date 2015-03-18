module Demo
  class TransferService
    def initialize(currency_converter)
      @currency_converter = currency_converter
    end

    def transfer(from, to, money, comment)
      minus_amount = @currency_converter.convert(money.currency, from.currency, money.amount)
      plus_amount = @currency_converter.convert(money.currency, to.currency, money.amount)
      t1 = Transaction.new(from, -minus_amount, comment)
      t2 = Transaction.new(to, plus_amount, comment)
      from.add_transaction(t1)
      to.add_transaction(t2)
    end
  end
end
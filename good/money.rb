module Demo
  class Money
    include CurrencyConverter

    attr_reader :amount, :currency

    def initialize(amount, currency)
      @amount = amount
      @currency = currency
    end

    def to_s
      "#{@amount} #{@currency.to_s.capitalize}"
    end
  end
end
module Demo
  module CurrencyConverter
    RATES = {
      dragons: 1.0,
      stags: 8.1,
      groats: 121.4,
      pennies: 268.0
    }

    def to(target_currency)
      from_rate = RATES[currency]
      to_rate = RATES[target_currency]
      target_amount = to_rate * amount / from_rate
      Money.new target_amount, target_currency
    end
  end
end
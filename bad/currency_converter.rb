module Demo
  class CurrencyConverter
    DRAGON_EXCHANGE_RATES = {
      Currency::DRAGONS => 1.0,
      Currency::STAGS => 8.1,
      Currency::GROATS => 121.4,
      Currency::PENNIES => 268.0 }

    def convert(from, to, amount)
      from_rate = DRAGON_EXCHANGE_RATES[from]
      to_rate = DRAGON_EXCHANGE_RATES[to]

      return to_rate * amount / from_rate
    end
  end
end
module Demo
  class KingsMentalStateCalculator
    KINGS_ENVY_THRESHOLD_GROATS = 100
    KINGS_GRACE = 1000

    def initialize(currency_converter)
      @currency_converter = currency_converter
    end

    def get_envy(owner)
      balance_in_groats = @currency_converter.convert(owner.account.currency, Currency::GROATS,
                                                      owner.account.get_balance.amount)
      incomes_without_trash = owner.account.transactions.
        map { |t| @currency_converter.convert(owner.account.currency, Currency::GROATS, t.amount) }.
        select { |amount| amount > KINGS_ENVY_THRESHOLD_GROATS }
      transactions_count_to_envy = incomes_without_trash.count
      if transactions_count_to_envy == 0
        transactions_count_to_envy = 1
      end
      envy = balance_in_groats / (transactions_count_to_envy * KINGS_GRACE)
      return envy.to_i
    end
  end
end
module Demo
  module KingsMentalStateCalculator
    KINGS_ENVY_THRESHOLD_GROATS = 100
    KINGS_GRACE = 1000

    def kings_envy_for(owner)
      balance_in_groats = owner.account.balance.to(:groats)
      count_to_envy = owner.account.transactions.select { |t| t.to(:groats).amount > KINGS_ENVY_THRESHOLD_GROATS }.count
      count_to_envy = 1 if count_to_envy == 0
      envy = balance_in_groats.amount / (count_to_envy * KINGS_GRACE)
      envy.to_i
    end
  end
end
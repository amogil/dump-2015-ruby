module Demo
  class ReceiptConsolePrinter
    def initialize(kings_mental_state_calculator)
      @kings_mental_state_calculator = kings_mental_state_calculator
    end

    def print(owner)
      balance = owner.account.get_balance
      puts("----------- RECEIPT -----------")
      puts("Customer: %s (%s)" % [owner.title, owner.words])
      puts("Balance: %2.f %s" % [balance.amount, Currency.name_of(balance.currency)])
      puts("King's envy: %d" % @kings_mental_state_calculator.get_envy(owner))
      puts("-------------------------------")
      puts("")
    end
  end
end
module Demo
  class BalanceConsolePrinter
    def print(owner, balance_calculator)
      puts("----------- RECEIPT -----------")
      puts("Customer: %s (%s)" % [owner.title, owner.words])
      puts("Balance: %2.f %s" % [balance_calculator.get_balance, Currency.name(balance_calculator.currency)])
      puts("-------------------------------")
      puts("")
    end
  end
end
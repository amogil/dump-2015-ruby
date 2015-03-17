module Demo
  class TransferConsolePrinter
    def print(from, to, money)
      puts("%s has taken %2.f %s from %s\n\n" % [to.title, money.amount, Currency.name_of(money.currency), from.title])
    end
  end
end
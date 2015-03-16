module Demo
  class TransferConsolePrinter
    def print(from, to, amount, currency)
      puts("%s has taken %2.f %s from %s\n\n" % [to.title, amount, Currency.name(currency), from.title])
    end
  end
end
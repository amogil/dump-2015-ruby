module Demo
  module BalanceConsolePrinter
    def print_balance(owner)
      puts "----------- RECEIPT -----------"
      puts "Customer: #{owner.title} (#{owner.words})"
      puts "Balance: #{owner.account.balance} #{Currency.name_of(owner.account.currency)}"
      puts "-------------------------------"
      puts ""
    end
  end
end
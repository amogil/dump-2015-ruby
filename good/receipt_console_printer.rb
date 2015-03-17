module Demo
  module ReceiptConsolePrinter
    include KingsMentalStateCalculator

    def print_receipt_for(owner)
      balance = owner.account.balance
      puts "----------- RECEIPT -----------"
      puts "Customer: #{owner.title} (#{owner.words})"
      puts "Balance: #{balance}"
      puts "King's envy: #{kings_envy_for owner}"
      puts "-------------------------------"
      puts ""
    end
  end
end
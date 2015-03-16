require 'securerandom'

require_relative 'balance_calculator'
require_relative 'transaction_creator'
require_relative 'account'
require_relative 'currency'
require_relative 'currency_converter'
require_relative 'owners_factory'
require_relative 'owner'
require_relative 'transaction'
require_relative 'balance_console_printer'
require_relative 'transfer_console_printer'

module Demo
  def self.run
    demo = Demo.new
    demo.show
  end

  class Demo
    include BalanceConsolePrinter
    include TransferConsolePrinter

    def show
      starks = Owner.create "House Stark", "Winterfell", "Winter is Coming", Currency::STAGS
      lannisters = Owner.create "House Lannister", "Casterly Rock", "Hear Me Roar!", Currency::DRAGONS

      print_balance starks
      print_balance lannisters

      starks.account.transfer_to lannisters.account, 100.dragons, "Pwned by Lannisters"
      print_transfer starks, lannisters, 100.dragons

      print_balance starks
      print_balance lannisters
    end
  end
end

Demo.run
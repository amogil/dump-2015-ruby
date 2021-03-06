require 'securerandom'
require 'active_support/all'

require_relative 'account'
require_relative 'currency_converter'
require_relative 'money'
require_relative 'owner'
require_relative 'transaction'
require_relative 'kings_mental_state_calculator'
require_relative 'receipt_console_printer'
require_relative 'transfer_service'
require_relative 'money_methods'

module Demo
  def self.run
    demo = Demo.new
    demo.show
  end

  class Demo
    include ReceiptConsolePrinter
    include TransferService

    def show
      starks = Owner.new "House Stark", "Winterfell", "Winter is Coming", 1500.stags
      lannisters = Owner.new "House Lannister", "Casterly Rock", "Hear Me Roar!", 9999.dragons

      print_receipt_for starks
      print_receipt_for lannisters

      transfer starks.account, lannisters.account, 100.dragons, "Pwned by Lannisters"

      print_receipt_for starks
      print_receipt_for lannisters
    end
  end
end

Demo.run
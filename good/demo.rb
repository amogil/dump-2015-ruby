require 'securerandom'

require_relative 'balance_calculator'
require_relative 'transaction_creator'
require_relative 'account'
require_relative 'currency'
require_relative 'currency_converter'
require_relative 'owners_factory'
require_relative 'owner'
require_relative 'transaction'

module Demo
  def self.run
    demo = Demo.new
    demo.show
  end

  class Demo
    def show
      starks = Owner.create "House Stark", "Winterfell", "Winter is Coming", Currency::STAGS
      lannisters = Owner.create "House Lannister", "Casterly Rock", "Hear Me Roar!", Currency::DRAGONS

      print_balance starks
      print_balance lannisters

      starks.account.transfer_to lannisters.account, 100.dragons, "Pwned by Lannisters"

      print_balance starks
      print_balance lannisters
    end

    def print_balance(owner)
      puts "----------- RECEIPT -----------"
      puts "Customer: #{owner.title} (#{owner.words})"
      puts "Balance: #{owner.account.balance} #{Currency.name_of(owner.account.currency)}"
      puts "-------------------------------"
      puts ""
    end
  end
end

Demo.run
require 'securerandom'

require_relative 'balance_calculator'
require_relative 'account'
require_relative 'currency'
require_relative 'currency_converter'
require_relative 'owner'
require_relative 'owners_factory'
require_relative 'transaction'
require_relative 'transaction_creator'

module Demo
  def self.run
    demo = Demo.new
    demo.show
  end

  class Demo
    def show
      owners_factory = OwnersFactory.new
      starks = owners_factory.create "House Stark", "Winterfell", "Winter is Coming", Currency::STAGS
      lannisters = owners_factory.create "House Lannister", "Casterly Rock", "Hear Me Roar!", Currency::DRAGONS

      print_balance starks
      print_balance lannisters

      ops starks, lannisters, 100.dragons

      print_balance starks
      print_balance lannisters
    end

    def ops(starks, lannisters, amount)
      transaction_creator = TransactionCreator.new starks.account, lannisters.account
      transaction_creator.create amount, "Pwned by Lannisters"

      puts "#{lannisters.title} has taken #{amount} #{} from #{starks.title}\n\n"
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
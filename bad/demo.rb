require 'securerandom'
require_relative 'account'
require_relative 'balance_calculator'
require_relative 'balance_calculators_factory'
require_relative 'currency'
require_relative 'currency_converter'
require_relative 'owner'
require_relative 'owners_factory'
require_relative 'transaction'
require_relative 'transaction_creator'
require_relative 'transaction_creators_factory'

module Demo
  def self.run
    owners_factory = OwnersFactory.new
    balance_calculators_factory = BalanceCalculatorsFactory.new
    currency_converter = CurrencyConverter.new
    transaction_creators_factory = TransactionCreatorsFactory.new(currency_converter)
    demo = Demo.new(owners_factory, balance_calculators_factory, transaction_creators_factory)
    demo.show
  end

  class Demo
    def initialize(owners_factory, balance_calculators_factory, transaction_creators_factory)
      @owners_factory = owners_factory
      @balance_calculators_factory = balance_calculators_factory
      @transaction_creators_factory = transaction_creators_factory
    end

    def show
      starks = @owners_factory.create("House Stark", "Winterfell", "Winter is Coming", Currency::STAGS)
      lannisters = @owners_factory.create("House Lannister", "Casterly Rock", "Hear Me Roar!", Currency::DRAGONS)

      starks_balance_calculator = @balance_calculators_factory.create(starks.account)
      lannisters_balance_calculator = @balance_calculators_factory.create(lannisters.account)

      print_balance(starks, starks_balance_calculator)
      print_balance(lannisters, lannisters_balance_calculator)

      ops(starks, lannisters, 100, Currency::DRAGONS)

      print_balance(starks, starks_balance_calculator)
      print_balance(lannisters, lannisters_balance_calculator)
    end

    def ops(starks, lannisters, amount, currency)
      transaction_creator = @transaction_creators_factory.create(starks.account, lannisters.account)
      transaction_creator.create(currency, amount, "Pwned by Lannisters")

      puts("%s has taken %2.f %s from %s\n\n" % [lannisters.title, amount, Currency.name(currency), starks.title])
    end

    def print_balance(owner, balance_calculator)
      puts("----------- RECEIPT -----------")
      puts("Customer: %s (%s)" % [owner.title, owner.words])
      puts("Balance: %2.f %s" % [balance_calculator.get_balance, Currency.name(balance_calculator.currency)])
      puts("-------------------------------")
      puts("")
    end
  end
end

Demo.run
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
require_relative 'balance_console_printer'
require_relative 'transfer_console_printer'

module Demo
  def self.run
    owners_factory = OwnersFactory.new
    balance_calculators_factory = BalanceCalculatorsFactory.new
    currency_converter = CurrencyConverter.new
    transaction_creators_factory = TransactionCreatorsFactory.new(currency_converter)
    balance_console_printer = BalanceConsolePrinter.new
    transfer_console_printer = TransferConsolePrinter.new
    demo = Demo.new(owners_factory, balance_calculators_factory, transaction_creators_factory, balance_console_printer,
                    transfer_console_printer)
    demo.show
  end

  class Demo
    def initialize(owners_factory, balance_calculators_factory, transaction_creators_factory, balance_console_printer,
                   transfer_console_printer)
      @owners_factory = owners_factory
      @balance_calculators_factory = balance_calculators_factory
      @transaction_creators_factory = transaction_creators_factory
      @balance_console_printer = balance_console_printer
      @transfer_console_printer = transfer_console_printer
    end

    def show
      starks = @owners_factory.create("House Stark", "Winterfell", "Winter is Coming", Currency::STAGS)
      lannisters = @owners_factory.create("House Lannister", "Casterly Rock", "Hear Me Roar!", Currency::DRAGONS)

      starks_balance_calculator = @balance_calculators_factory.create(starks.account)
      lannisters_balance_calculator = @balance_calculators_factory.create(lannisters.account)

      @balance_console_printer.print(starks, starks_balance_calculator)
      @balance_console_printer.print(lannisters, lannisters_balance_calculator)

      transfer(starks, lannisters, 100, Currency::DRAGONS)

      @balance_console_printer.print(starks, starks_balance_calculator)
      @balance_console_printer.print(lannisters, lannisters_balance_calculator)
    end

    def transfer(starks, lannisters, amount, currency)
      transaction_creator = @transaction_creators_factory.create(starks.account, lannisters.account)
      transaction_creator.create(currency, amount, "Pwned by Lannisters")

      @transfer_console_printer.print(starks, lannisters, amount, currency)
    end
  end
end

Demo.run
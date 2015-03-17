require 'securerandom'
require 'active_support/all'

require_relative 'account'
require_relative 'money'
require_relative 'currency'
require_relative 'currency_converter'
require_relative 'owner'
require_relative 'owners_repository'
require_relative 'transaction'
require_relative 'receipt_console_printer'
require_relative 'transfer_console_printer'
require_relative 'kings_mental_state_calculator'
require_relative 'transfer_service'


module Demo
  def self.run
    owners_factory = OwnersRepository.new
    currency_converter = CurrencyConverter.new
    transfer_service = TransferService.new(currency_converter)
    kings_mental_state_calculator = KingsMentalStateCalculator.new(currency_converter)
    receipt_console_printer = ReceiptConsolePrinter.new(kings_mental_state_calculator)
    transfer_console_printer = TransferConsolePrinter.new
    demo = Demo.new(owners_factory, transfer_service, receipt_console_printer, transfer_console_printer)
    demo.show
  end

  class Demo
    def initialize(owners_repository, transfer_service, receipt_console_printer, transfer_console_printer)
      @owners_repository = owners_repository
      @transfer_service = transfer_service
      @receipt_console_printer = receipt_console_printer
      @transfer_console_printer = transfer_console_printer
    end

    def show
      starks_init_money = Money.new(1500, Currency::STAGS)
      lannisters_init_money = Money.new(9999, Currency::DRAGONS)
      starks = @owners_repository.create_new("House Stark", "Winterfell", "Winter is Coming", starks_init_money)
      lannisters = @owners_repository.create_new("House Lannister", "Casterly Rock", "Hear Me Roar!",
                                                 lannisters_init_money)

      @receipt_console_printer.print(starks)
      @receipt_console_printer.print(lannisters)

      money = Money.new(100, Currency::DRAGONS)
      @transfer_service.transfer(starks.account, lannisters.account, money, "Pwned by Lannisters")
      @transfer_console_printer.print(starks, lannisters, money)

      @receipt_console_printer.print(starks)
      @receipt_console_printer.print(lannisters)
    end
  end
end

Demo.run
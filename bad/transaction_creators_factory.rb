module Demo
  class TransactionCreatorsFactory
    def initialize(currency_converter)
      @currency_converter = currency_converter
    end

    def create(from, to)
      return TransactionCreator.new(from, to, @currency_converter)
    end
  end
end
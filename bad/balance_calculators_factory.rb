module Demo
  class BalanceCalculatorsFactory
    def create(account)
      return BalanceCalculator.new(account)
    end
  end
end
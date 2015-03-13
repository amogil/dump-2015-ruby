module Demo
  class BalanceCalculator
    def initialize(account)
      @account = account
    end

    def get_balance
      return @account.initial_balance + @account.transactions.inject(0) { |sum, t| sum + t.amount }
    end

    def currency
      return @account.currency
    end
  end
end
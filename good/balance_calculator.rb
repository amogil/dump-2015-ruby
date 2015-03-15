module Demo
   module BalanceCalculator
    def balance
      initial_balance + transactions.map(&:amount).reduce(0, &:+)
    end
  end
end
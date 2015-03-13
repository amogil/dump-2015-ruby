module Demo
  class OwnersFactory
    def initialize
      @random = Random.new
    end

    def create(title, castle, words, currency)
      initial_balance = @random.rand(0..10000)
      account = Account.new(currency, initial_balance)
      return Owner.new(title, castle, words, account)
    end
  end
end
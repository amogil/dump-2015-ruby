module Demo
  class OwnersFactory
    def create(title, castle, words, currency)
      initial_balance = Random.rand 0..10000
      account = Account.new currency, initial_balance
      Owner.new title, castle, words, account
    end
  end
end
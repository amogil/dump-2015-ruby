module Demo
  module OwnersRepository
    def create(title, castle, words, init_balance)
      account = Account.new init_balance.currency, init_balance.amount
      owner = Owner.new title, castle, words, account
      # Save to DB
      owner
    end
  end
end
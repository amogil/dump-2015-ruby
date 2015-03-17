module Demo
  class OwnersRepository
    def create_new(title, castle, words, init_balance)
      account = Account.new(init_balance.currency, init_balance.amount)
      owner = Owner.new(title, castle, words, account)
      # Save to DB
      return owner
    end
  end
end
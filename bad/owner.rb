module Demo
  class Owner
    attr_reader :title, :castle, :words, :account

    def initialize(title, castle, words, init_balance)
      @title = title
      @castle = castle
      @words = words
      @account = Account.new(init_balance.currency, init_balance.amount)
    end
  end
end
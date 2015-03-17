module Demo
  class Owner
    extend OwnersRepository

    attr_reader :title, :castle, :words, :account

    def initialize(title, castle, words, account)
      @title = title
      @castle = castle
      @words = words
      @account = account
    end
  end
end
module Demo
  module Currency
    DRAGONS = 0
    STAGS = 1
    GROATS = 2
    PENNIES = 3

    def self.name_of(value)
      constants.find { |name| const_get(name) == value }.capitalize
    end
  end
end
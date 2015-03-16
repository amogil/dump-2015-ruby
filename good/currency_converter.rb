module Demo
  module CurrencyConverter
    RATES = {Currency::DRAGONS => 1.0, Currency::STAGS => 8.1,
             Currency::GROATS => 121.4, Currency::PENNIES => 268.0}

    module MixIn
      def to(currency)
        name = Currency.name_of currency
        send name.downcase
      end

      RATES.each do |const, rate|
        name = Currency.name_of const
        define_method name.downcase do
          self * rate
        end
      end
    end
  end
end

class Float
  include Demo::CurrencyConverter::MixIn
end

class Fixnum
  include Demo::CurrencyConverter::MixIn
end
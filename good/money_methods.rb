module Demo
  module MoneyMethods
    CurrencyConverter::RATES.keys.each do |currency_name|
      define_method currency_name.to_s do
        Money.new self, currency_name
      end
    end
  end
end

class Float
  include Demo::MoneyMethods
end

class Fixnum
  include Demo::MoneyMethods
end
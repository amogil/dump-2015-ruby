module Demo
  module TransferConsolePrinter
    def print_transfer(from, to, amount)
      puts "#{to.title} has taken #{amount} from #{from.title}\n\n"
    end
  end
end
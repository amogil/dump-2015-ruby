module Demo
  module TransferConsolePrinter
    def print_transfer_log(from, to, money)
      puts "#{to.title} has taken #{money} from #{from.title}\n\n"
    end
  end
end
module Demo
  module TransferService
    def transfer(source_account, target_account, money, comment)
      minus = money.to(source_account.currency)
      plus = money.to(target_account.currency)
      t1 = Transaction.new source_account, -minus.amount, comment
      t2 = Transaction.new target_account, plus.amount, comment
      t1.assign_reference t2
      t2.assign_reference t1
      source_account.add_transaction t1
      target_account.add_transaction t2
      [t1, t1]
    end
  end
end
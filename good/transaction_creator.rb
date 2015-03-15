module Demo
  module TransactionCreator
    def transfer_to(account, amount, comment)
      t1 = Transaction.new self, -amount.to(currency), comment
      t2 = Transaction.new account, amount.to(account.currency), comment
      t1.assign_reference t2
      t2.assign_reference t1
      add_transaction t1
      account.add_transaction t2
      [t1, t1]
    end
  end
end
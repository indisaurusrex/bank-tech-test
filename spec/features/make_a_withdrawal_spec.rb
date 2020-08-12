# frozen_string_literal: true

xdescribe BankAccount do
  describe '#withdraw' do
    it 'reduces the balance by the required amount' do
      account = BankAccount.new
      account.deposit(1000, '14-01-2020')
      account.withdraw(500, '5-06-2020')
      statement = <<~STATEMENT
        date || credit || debit || balance
        05/06/2020 || || 500.00 || 500.00
        14/01/2020 || 1000.00 || || 1000.00
      STATEMENT
      expect { account.print_statement }.to output(statement).to_stdout
    end
  end
end

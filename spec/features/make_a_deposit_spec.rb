# frozen_string_literal: true

describe BankAccount do
  describe '#deposit' do
    it 'adjusts the balance by the deposited amount' do
      account = BankAccount.new
      account.deposit(1000, '14-01-2020')
      account.deposit(100, '5-06-2020')
      statement = <<~STATEMENT
        date || credit || debit || balance
        05/06/2020 || 100.00 || || 1100.00
        14/01/2020 || 1000.00 || || 1000.00
      STATEMENT
      expect { account.print_statement }.to output(statement).to_stdout
    end
  end
end

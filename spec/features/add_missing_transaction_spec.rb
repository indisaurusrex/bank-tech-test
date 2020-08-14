# frozen_string_literal: true

describe BankAccount do
  describe '#deposit' do
    it 'shows a missing deposit and corrects the balances' do
      account.deposit(1000, '14-01-2020')
      account.deposit(100, '20-02-2020')
      account.deposit(1000, '20-01-2020')
      statement = <<~STATEMENT
        date || credit || debit || balance
        20/02/2020 || 100.00 || || 2100.00
        20/01/2020 || 1000.00 || || 2000.00
        14/01/2020 || 1000.00 || || 1000.00
      STATEMENT
      expect { account.print_statement }.to output(statement).to_stdout
    end
  end
end

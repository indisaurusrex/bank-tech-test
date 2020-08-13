# frozen_string_literal: true

require './lib/account'

describe BankAccount do
  describe '#print_statement' do
    it 'can print a blank statement for a new account' do
      expect do
        BankAccount.new.print_statement
      end.to output("date || credit || debit || balance\n").to_stdout
    end

    it 'prints the statement it is given to the console' do
      statement_double = double :statement, 
                                :print => [
                                  "date || credit || debit || balance\n",
                                  "14/01/2020 || 10.00 || || 10.00\n"
                                ]
      printed_statement = <<~STATEMENT
        date || credit || debit || balance
        14/01/2020 || 10.00 || || 10.00
      STATEMENT
      expect { account.print_statement(statement_double) }.to output(printed_statement).to_stdout
    end
  end

  describe '#deposit' do
    it 'accepts only positive amounts' do
      expect do
        BankAccount.new.deposit(-1000, '14-01-2020')
      end.to raise_error 'Please enter a positive number for the deposit amount'
    end
    it 'updates the balance by the deposit amount' do
      account.deposit(100, '14-01-2020')
      expect(account.balance).to eq 100
    end
  end

  describe '#withdraw' do
    it 'reduces the balance by the amount' do
      account.withdraw(100, '14-01-2020')
      expect(account.balance).to eq(-100)
    end
  end
end

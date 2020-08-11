# frozen_string_literal: true

require './app'

describe BankAccount do
  describe '#print_statement' do
    it 'can print a blank statement for a new account' do
      expect do
        BankAccount.new.print_statement
      end.to output("date || credit || debit || balance\n").to_stdout
    end
  end
end

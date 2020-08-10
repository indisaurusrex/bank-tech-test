require './app'

describe 'BankAccount' do
  describe '#statement' do
    it 'prints a blank statement for a new account' do
      expect do
        BankAccount.new.statement 
      end.to output("date || credit || debit || balance").to_stdout
    end
  end
end
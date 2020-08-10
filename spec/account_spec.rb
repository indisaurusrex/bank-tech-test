require './app'

describe 'BankAccount' do
  describe '#statement' do
    it 'prints a blank statement for a new account' do
      expect do
        BankAccount.new.print_statement
      end.to output("date || credit || debit || balance\n").to_stdout
    end
  end

  describe '#deposit' do
    it 'adds the date and amount of a deposit to the account' do
      account = BankAccount.new
      account.deposit(1000, "14/01/2020")
      expect(account.statement).to include("14/01/2020 || 1000.00 || || 1000.00")
    end
  end
  
end
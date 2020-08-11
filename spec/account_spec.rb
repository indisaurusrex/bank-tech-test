require './app'

describe 'BankAccount' do
  describe '#print_statement' do
    it 'prints a blank statement for a new account' do
      expect do
        BankAccount.new.print_statement
      end.to output("date || credit || debit || balance\n").to_stdout
    end

  end

  describe '#deposit' do
    it 'increases the balance by the deposited amount' do
      account = BankAccount.new
      account.deposit(1000, "14/01/2020")
      account.deposit(100, "5/06/2020")
      statement = <<~STATEMENT
        date || credit || debit || balance
        05/06/2020 || 100.00 || || 1100.00
        14/01/2020 || 1000.00 || || 1000.00
        STATEMENT
      expect { account.print_statement }.to output(statement).to_stdout
    end
  end

  describe '#withdraw' do
    it 'reduces the balance by the required amount' do
      account = BankAccount.new
      account.deposit(1000, "14/01/2020")
      account.withdraw(500, "5/06/2020")
      statement = <<~STATEMENT
        date || credit || debit || balance
        05/06/2020 || || 500.00 || 500.00
        14/01/2020 || 1000.00 || || 1000.00
        STATEMENT
      expect { account.print_statement }.to output(statement).to_stdout
    end
  
  end
  
end
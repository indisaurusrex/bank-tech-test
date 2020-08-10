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
      expect(account.balance).to eq(1100)
    end

    it 'does not accept dates in the future' do
      account = BankAccount.new
      expect { account.deposit(1000, "14/01/2024") }.to raise_error "Please enter a date in the past"
    end
  end

  describe '#withdraw' do
    it 'reduces the balance by the required amount' do
      account = BankAccount.new
      account.deposit(1000, "14/01/2020")
      account.withdraw(500, "5/06/2020")
      expect(account.balance).to eq(500)
    end
  
  end
  
end
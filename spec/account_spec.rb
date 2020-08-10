require './app'

describe 'account' do
  describe 'statement' do
    it 'shows the dates of transactions and the current balance' do
      account = BankAccount.new
      account.deposit(1000, 14/01/2020)
      expect(account.statement).to eq "date || credit || debit || balance\n14/01/2020 || 1000.00 || || 1000.00"
    end
  end
end
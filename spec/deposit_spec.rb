# frozen_string_literal: true

describe BankAccount do
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
end

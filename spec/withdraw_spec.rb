# frozen_string_literal: true

describe BankAccount do
  describe '#withdraw' do
    it 'reduces the balance by the amount' do
      account.withdraw(100, '14-01-2020')
      expect(account.balance).to eq(-100)
    end
  end
end

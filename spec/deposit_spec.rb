# frozen_string_literal: true

describe BankAccount do
  describe '#deposit' do
    it 'accepts only positive amounts' do
      expect do
        BankAccount.new.deposit(-1000, '14-01-2020')
      end.to raise_error "Please enter a positive number for the deposit amount"
    end
  end
end
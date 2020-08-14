# frozen_string_literal: true

describe TransactionHistory do
  describe '#add_transaction' do
    it 'adds the transaction to the history' do
      t = TransactionHistory.new
      t.add_transaction({ date: '14-01-2020', amount: 10, type: 'deposit' })
      expect(t.history).to include({ date: '14-01-2020', amount: 10, type: 'deposit' })
    end

    it 'can keep track of multiple transactions' do
      t = TransactionHistory.new
      t.add_transaction({ date: '14-01-2020', amount: 10, type: 'deposit' })
      t.add_transaction({ date: '15-01-2020', amount: 10, type: 'deposit' })
      expect(t.history.length).to eq 2
    end
  end
end
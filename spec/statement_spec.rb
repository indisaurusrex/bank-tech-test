# frozen_string_literal: true

describe Statement do
  describe '#print' do
    it 'provides the text ready to be printed to the console' do
      s = Statement.new([])
      expect(s.print).to eq ["date || credit || debit || balance\n"]
    end
  end

  describe '#format_for_printing' do
    it 'adds the credit line to the array if there was a deposit transaction' do
      s = Statement.new([{ date: '14-1-2020', amount: 100, balance: 100, type: 'deposit' }])
      result = s.send(:format_for_printing, [{ date: '14-1-2020', amount: 100, balance: 100, type: 'deposit' }])
      expect(result).to include "14/01/2020 || 100.00 || || 100.00\n"
    end

    it 'adds the debit line to the printable statement array if there was a withdrawal' do
      s = Statement.new([{ date: '14-1-2020', amount: 100, balance: 100, type: 'withdrawal' }])
      result = s.send(:format_for_printing, [{ date: '14-1-2020', amount: 100, balance: 100, type: 'withdrawal' }])
      expect(result).to include "14/01/2020 || || 100.00 || 100.00\n"
    end
  end
end

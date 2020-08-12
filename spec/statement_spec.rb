# frozen_string_literal: true

describe Statement do
  describe '#print' do
    it 'provides the text ready to be printed to the console' do
      s = Statement.new([])
      expect(s.print).to eq ['date || credit || debit || balance']
    end
  end

  describe '#format_for_printing' do
    it 'adds the credit line to the array if there was a deposit transaction' do
      s = Statement.new([{date: '14-1-2020', credit: 100, balance: 100}])
      s.format_for_printing(s.transaction_history)
      expect(s.printable_statement).to include '14/01/2020 || 100.00 || || 100.00'
    end
    it 'adds the debit line to the printable statement array if there was a withdrawal' do
      s = Statement.new([{date: '14-1-2020', debit: 100, balance: 100}])
      s.format_for_printing(s.transaction_history)
      expect(s.printable_statement).to include '14/01/2020 || || 100.00 || 100.00'
    end
  end
end

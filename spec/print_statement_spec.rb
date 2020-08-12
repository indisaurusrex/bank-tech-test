# frozen_string_literal: true

describe Statement do
  describe '#print' do
    it 'provides the text ready to be printed to the console' do
      s = Statement.new([])
      expect(s.print).to eq ['date || credit || debit || balance']
    end
  end
end

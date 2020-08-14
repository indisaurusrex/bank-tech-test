# frozen_string_literal: true

class TransactionHistory
  attr_reader :history

  def initialize
    @history = []
    @balance = 0
  end

  def add_transaction(transaction)
    @history.push(transaction)
  end

  def process
    balance_calculator(sort_ascending)
  end

  private

  def sort_ascending
    @history.sort_by { |transaction| transaction[:date] }
  end

  def balance_calculator(sorted_asc)
    sorted_asc if sorted_asc.empty?
    sorted_asc.each do |transaction|
      if transaction[:type] == 'deposit'
       @balance += transaction[:amount]
      else
        @balance -= transaction[:amount]
      end
      transaction[:balance] = @balance
    end
  end

end
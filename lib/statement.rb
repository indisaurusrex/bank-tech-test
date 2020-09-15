# frozen_string_literal: true

# this class handles the formatting of the transaction data ready to be printed
class Statement
  attr_accessor :transaction_history

  def initialize(transaction_history)
    @history = transaction_history
  end

  def print
    reversed = reverse_sort(@history)
    format_for_printing(reversed)
  end

  private

  def reverse_sort(history)
    history.sort_by { |transaction| transaction[:date] }.reverse!
  end

  def format_for_printing(transaction_history)
    printable_statement = ["date || credit || debit || balance\n"]
    printable_transactions = []
    
    transaction_history.each do |transaction|
      readable_transaction = make_it_readable(transaction)
      printable_transactions = add_table_lines(readable_transaction)
    end

    printable_statement += printable_transactions
  end

  def make_it_readable(transaction)
    transaction[:date] = format_date(transaction)
    transaction[:amount] = format_money(transaction[:amount])
    transaction[:balance] = format_money(transaction[:balance])
    transaction
  end

  def add_table_lines(readable_transaction)
    printable_statement = []
      if readable_transaction[:type] == 'deposit'
        printable_statement.push("#{date} || #{amount} || || #{balance}\n")
      else
        printable_statement.push("#{date} || || #{amount} || #{balance}\n")
      end
    printable_statement
  end

  def format_date(transaction)
    Date.parse(transaction[:date]).strftime('%d/%m/%Y')
  end

  def format_money(money)
    format('%.2f', money)
  end
end

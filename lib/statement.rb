# frozen_string_literal: true

# this class handles the formatting of the transaction data ready to be printed
class Statement
  attr_accessor :transaction_history

  def initialize(transaction_history)
    @history = transaction_history
  end

  def print
    reversed = sort_balanced(@history)
    format_for_printing(reversed)
  end

  private

  def sort_balanced(history)
    history.sort_by { |transaction| transaction[:date] }.reverse!
  end

  def format_for_printing(transaction_history)
    printable_statement = ["date || credit || debit || balance\n"]

    transaction_history.each do |transaction|
      date = format_date(transaction)
      amount = format_money(transaction[:amount])
      balance = format_money(transaction[:balance])

      if transaction[:type] == 'deposit'
        printable_statement.push("#{date} || #{amount} || || #{balance}\n")
      else
        printable_statement.push("#{date} || || #{amount} || #{balance}\n")
      end
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

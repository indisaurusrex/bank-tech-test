# frozen_string_literal: true

# this class handles the formatting of the transaction data ready to be printed
class Statement
  attr_accessor :transaction_history

  def initialize(transaction_history)
    @transaction_history = transaction_history
  end 

  def print
    format_for_printing(@transaction_history)
  end

  private

  def format_for_printing(transaction_history)
    printable_statement = ["date || credit || debit || balance\n"]

    transaction_history.each do |transaction|
      date = format_date(transaction)
      amount = format_transaction_amount(transaction)
      balance = format_balance(transaction)

      if transaction[:credit]
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

  def format_balance(transaction)
    format('%.2f', transaction[:balance])
  end

  def format_transaction_amount(transaction)
    return format('%.2f', transaction[:credit]) if transaction[:credit]
    return format('%.2f', transaction[:debit]) if transaction[:debit]
  end
end

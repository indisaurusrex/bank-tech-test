# frozen_string_literal: true

# this class handles the formatting of the transaction data ready to be printed
class Statement
  attr_accessor :transaction_history

  def initialize(transaction_history)
    @history = transaction_history
    @balance = 0
  end 

  def print
    balanced = calculate_balances(sorter)
    reverse_sort_balanced = sort_balanced(balanced)
    format_for_printing(reverse_sort_balanced)
  end

  private

  def calculate_balances(sorted_history)
    if sorted_history.length == 0
      return sorted_history
    else
      sorted_history.each do |transaction|
        if transaction[:type] == 'deposit'
          @balance += transaction[:amount]
        else
          @balance -= transaction[:amount]
        end
        transaction[:balance] = @balance
      end
    end
  end

  def sorter
    @history.sort_by { |transaction| transaction[:date] }
  end

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

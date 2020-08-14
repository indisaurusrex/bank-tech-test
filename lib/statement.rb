# frozen_string_literal: true

# this class handles the formatting of the transaction data ready to be printed
class Statement
  attr_accessor :transaction_history

  def initialize(transaction_history)
    @history = transaction_history
    @balance = 0
  end 

  def sorter
    @history.sort_by { |transaction| transaction[:date] }
  end

  def sort_balanced(history)
    history.sort_by { |transaction| transaction[:date] }.reverse!
  end

  def balancer(sorted_t_h)
    if sorted_t_h.length == 0
      return sorted_t_h
    else
      sorted_t_h.each do |transaction|
        if transaction[:type] == 'deposit'
          @balance += transaction[:amount]
        else
          @balance -= transaction[:amount]
        end
        transaction[:balance] = @balance
      end
    end

  end
  # sorts the array and calls for the formatting to be done
  def print
    # balanced_hist = balancer(@history) if @history.length > 1
    # history = @history.sort_by { |transaction| transaction[:date] }.reverse!
    sorted = sorter
    balanced = balancer(sorted)
    reverse_sort_balanced = sort_balanced(balanced)
    format_for_printing(reverse_sort_balanced)
  end

  private

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

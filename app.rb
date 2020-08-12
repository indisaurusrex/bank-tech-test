# frozen_string_literal: true

require 'date'
# this class is a bank account to be able to do the banking activities specified
class BankAccount
  def initialize
    @transactions = []
    @balance = 0
  end

  def deposit(amount, date)
    @balance += amount
    @transactions.unshift({ date: date, credit: amount, balance: @balance })
  end

  def withdraw(amount, date)
    @balance -= amount
    @transactions.unshift({ date: date, debit: amount, balance: @balance })
  end

  def print_statement
    statement = Statement.new(@transactions)
    puts statement.print
  end
end

class Statement
  def initialize(transaction_history)
    @transaction_history = transaction_history
    @printable_statement = ["date || credit || debit || balance"]
  end

  def format_for_printing(t) 
    t.each do |transaction|
      date = format_date(transaction)
      amount, balance = format_transaction_amount(transaction), format_balance(transaction)

      if transaction[:credit] != nil
        @printable_statement.push("#{date} || #{amount} || || #{balance}")
      else
        @printable_statement.push("#{date} || || #{amount} || #{balance}")
      end
    end
  end

  def format_date(transaction)
    return Date.parse(transaction[:date]).strftime('%d/%m/%Y')
  end

  def format_balance(transaction)
    return '%.2f' % transaction[:balance] 
  end

  def format_transaction_amount(transaction)
    if transaction[:credit]
      return '%.2f' % transaction[:credit]
    else
      return '%.2f' % transaction[:debit]
    end
  end

  def print
    format_for_printing(@transaction_history)
    return @printable_statement
  end

end

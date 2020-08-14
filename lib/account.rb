# frozen_string_literal: true

require 'date'
require './lib/statement'
require './lib/transaction_history'
# this class is a bank account for the customer to interact with
class BankAccount
  def initialize(transaction_history = TransactionHistory.new)
    @transactions = transaction_history
  end

  def transactions
    @transactions.history
  end

  def deposit(amount, date)
    raise 'Please enter a positive number for the deposit amount' if amount.negative?

    @transactions.add_transaction({ date: date, amount: amount, type: 'deposit' })
  end

  def withdraw(amount, date)
    @transactions.add_transaction({ date: date, amount: amount, type: 'withdrawal' })
  end

  def print_statement(statement = Statement.new(@transactions.process))
    puts statement.print
  end
end

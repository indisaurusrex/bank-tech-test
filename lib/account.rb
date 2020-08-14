# frozen_string_literal: true

require 'date'
require './lib/statement'
require './lib/transaction_history'
# this class is a bank account for the customer to interact with
class BankAccount
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def deposit(amount, date)
    raise 'Please enter a positive number for the deposit amount' if amount.negative?

    @transactions.push({ date: date, amount: amount, type: 'deposit' })
  end

  def withdraw(amount, date)
    @transactions.push({ date: date, amount: amount, type: 'withdrawal' })
  end

  def print_statement(statement = Statement.new(@transactions))
    puts statement.print
  end
end

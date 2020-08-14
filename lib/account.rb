# frozen_string_literal: true

require 'date'
require './lib/statement'
# this class is a bank account for the customer to interact with
class BankAccount
  # attr_accessor :balance

  def initialize
    @transactions = []
    # @balance = 0
  end

  def deposit(amount, date)
    raise 'Please enter a positive number for the deposit amount' if amount.negative?
    # @balance += amount
    # @transactions.push({ date: date, amount: amount, balance: @balance, type: 'deposit' })
    @transactions.push({ date: date, amount: amount, type: 'deposit' })
  end

  def withdraw(amount, date)
    # @balance -= amount
    # @transactions.push({ date: date, amount: amount, balance: @balance, type: 'withdrawal' })
    @transactions.push({ date: date, amount: amount, type: 'withdrawal' })
  end

  def print_statement(statement = Statement.new(@transactions))
    puts statement.print
  end
end

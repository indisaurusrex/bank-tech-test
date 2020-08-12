# frozen_string_literal: true

require 'date'
require './lib/statement'
# this class is a bank account for the customer to interact with
class BankAccount
  def initialize
    @transactions = []
    @balance = 0
  end

  def deposit(amount, date)
    if amount < 0
      raise "Please enter a positive number for the deposit amount" 
    else
      @balance += amount
      @transactions.unshift({ date: date, credit: amount, balance: @balance })
    end
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

require 'date'

class BankAccount
attr_accessor :balance

  def initialize
    @transactions = []
    @balance = 0
  end

  def deposit(amount, date)
    @balance += amount
    @transactions.unshift({date: date, credit: amount, balance: @balance})
  end

  def withdraw(amount, date)
    @balance -= amount
    @transactions.unshift({date: date, debit: amount, balance: @balance})
  end

  def print_statement
    puts "date || credit || debit || balance"
    @transactions.each do |transaction|
      transaction_date = Date.parse(transaction[:date]).strftime('%d/%m/%Y')
      transaction_balance = '%.2f' % transaction[:balance]
      if transaction[:credit]
        credit = '%.2f' % transaction[:credit]
        puts "#{transaction_date} || #{credit} || || #{transaction_balance}"
      else
        debit = '%.2f' % transaction[:debit]
        puts "#{transaction_date} || || #{debit} || #{transaction_balance}"
      end
    end
  end

end
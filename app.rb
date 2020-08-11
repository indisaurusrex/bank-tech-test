require 'date'

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
    puts 'date || credit || debit || balance'

    @transactions.each do |transaction|
      transaction_date = Date.parse(transaction[:date]).strftime('%d/%m/%Y')

      if transaction[:credit]
        puts "#{transaction_date} || #{format('%.2f', transaction[:credit])} || || #{format('%.2f', transaction[:balance])}"
      else
        puts "#{transaction_date} || || #{format('%.2f', transaction[:debit])} || #{format('%.2f', transaction[:balance])}"
      end
    end
  end
end

require 'date'

class BankAccount
attr_accessor :balance

  def initialize
    @transactions = []
    @balance = 0
  end

  def deposit(amount, date)
    deposit_date = Date.parse(date)
    if deposit_date >= Date.today
      raise "Please enter a date in the past"
    end

    @balance += amount
  end

  def withdraw(amount, date)
    @balance -= amount
  end

  def print_statement
    puts "date || credit || debit || balance"
    # if @statement.length >= 1
    #   @statement.each do |line|
    #     puts "#{line[0].strftime('%d/%m/%Y')} || #{'%.2f' % line[1]} || || #{'%.2f' % line[4]}"
    #   end
    # end
  end

end
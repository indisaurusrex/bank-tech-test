require 'date'

class BankAccount
attr_accessor :statement

  def initialize
    @statement = ["date || credit || debit || balance"]
  end

  def deposit(amount, date)
    deposit_date = Date.parse(date)
    if deposit_date >= Date.today
      raise "Please enter a date in the past"
    else
      @statement.push("#{deposit_date.strftime('%d/%m/%Y')} || #{amount}.00 || || #{amount}.00")
    end
  end

  def print_statement
    puts @statement
  end

end
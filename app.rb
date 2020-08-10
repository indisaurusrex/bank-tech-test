class BankAccount
  def initialize
    @statement = ["date || credit || debit || balance"]
  end

  def deposit(amount, date)
    @statement.push("#{date} || #{amount}.00 || || #{amount}.00")
  end

  def print_statement
    puts @statement
  end

  def statement
    return @statement
  end
end
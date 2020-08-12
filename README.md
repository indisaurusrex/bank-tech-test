# Bank tech test

## About this app
A bank app where you can make deposits and withdrawals, and see a statement of the transactions with dates and running balance. 

## How to use
```
irb -r './lib/app.rb'

\\ create a new account
a = BankAccount.new
\\ make a deposit, include how much and when  
a.deposit(1000, "14-01-2020")
\\ make a withdrawal, include how much and when  
a.withdraw(10, "15-01-2020")
\\ print a statement 
a.print_statement
```
### How to run the tests
`rspec`



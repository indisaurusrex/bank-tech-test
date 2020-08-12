# Bank tech test

## About this app
A bank app where you can make deposits and withdrawals, and see a statement of the transactions with dates and running balance. 

## My approach
BankAccount is a class that can be accessed by the user to interact with the account including making deposits and withdrawals and asking for a statement to be printed.

Statement has a class of its own to handle the formatting of the data ready to be printed to the console. 

I think that with some more attention there should be a separate Transaction class and TransactionHistory class. These will handle the storing of the transactions and the balance updates per transaction. 

Currently the BankAccount class does the heavy lifting for checking the input is correct, and updating the balance as each transaction is made - which doesn't quite fit the SRP. 

I think there are some 

## How to use
```
irb -r './lib/app.rb'

\\ create a new account
a = BankAccount.new
\\ make a deposit, include how much and when  
a.deposit(1000, '14-01-2020')
\\ make a withdrawal, include how much and when  
a.withdraw(10, '15-01-2020')
\\ print a statement 
a.print_statement
```

It should look similar to this: 
![screenshot of bank app in use](./images/bank-app-screenshot.png)

### How to run the tests
```
rspec
rubocop
```

### Test coverage
Test coverage currently at 100%. If you pend the feature tests, the files within lib have 100% coverage, but the feature test files come up as having less - I'm not sure how to cover the tests themselves so have left this as it is. 

Rubocop is unhappy with my formatting and has 3 offenses. I've tried to fix this but can't get the annotated tokens to work, so left in for now. This is the message:
Style/FormatStringToken: Prefer annotated tokens (like %<foo>s) over unannotated tokens (like %s).
    format('%.2f', transaction[:balance])
    for the following lines: 
    lib/statement.rb:29:13
    lib/statement.rb:33:20
    lib/statement.rb:34:20

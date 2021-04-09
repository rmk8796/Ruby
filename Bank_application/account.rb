# Performs account related operations

require_relative 'transaction'
require_relative 'validinput'

class Account
  include ValidInput
  attr_reader :number, :name

  def initialize
    @name = accept_name
    @number = format('%04d', new_account_number)
    @transactions = []
    puts "Account of #{@name} is created with account number #{@number}"
  end

  # Deposit amount in account
  def deposit
    amount = accept_amount
    @transactions << Transaction.new(amount)
    print_transaction_statement(+1)
  end

  # Withdraw amount from account
  def withdraw
    amount = accept_amount
    return puts 'Warning You do not have sufficient balance' unless valid_withdrawl_amt?(amount)

    @transactions << Transaction.new(-amount)
    print_transaction_statement(-1)
  end

  def balance
  	puts "Your current balance is #{@transactions.map(&:amount).sum.round(2).to_f}"
  end

  # Account history of transactions
  def history
    puts "\nAccount History for account #{number}"
    puts "\nCredit\t\t\tDebit\t\t\tNote "
    puts @transactions.map(&:statement)
    balance
  end

  # Transaction statement
  # @todo Argument is named inappropriately (Boolean argument can be passed)
  def print_transaction_statement(type)
    if type.positive?
      puts "\n#{@transactions.map(&:amount).last.round(2).to_f} Rs has been credited to your account - #{name} #{number}"
    else
      puts "\n#{-@transactions.map(&:amount).last.round(2).to_f} Rs has been debited from your account - #{name} #{number}"
    end
    balance
  end

  private

  def new_account_number
    Bank.all.count + 1
  end

  def valid_withdrawl_amt?(amt)
    amt <= @transactions.map(&:amount).sum
  end

  # @todo Instead of defining method as private in this way, place all private methods under private or use private :method_name, right below the method
  # This makes it difficult to figure out method is private when method is defined somewhere else in the file
end

# Provides Bank services

require_relative 'account'

class Bank
  @@accounts = []

  def self.all
    @@accounts
  end

  def self.options
    options = [
      '********Welcome to Bank*****',
      '1. Create Bank Account',
      '2. Withdraw Cash',
      '3. Deposit Cash',
      '4. Account History',
      '5. Current Balance',
      '6. Quit',
      '****************************'
    ]
    puts options.join("\n")
    puts 'Enter Your Choice:'
  end

  def self.services
    loop do
      Bank.options
      case gets.chomp.to_i
      when 1 then @@accounts << Account.new
      when 2 then account.withdraw
      when 3 then account.deposit
      when 4 then account.history
      when 5 then account.balance
      when 6 then abort('THANK U FOR VISITING BANK')
      end
    end
  end

  # @todo This method is inappropriate to use as Class method (or method name is in appropriate it can be find_account / search_account)
  def self.account
    puts 'Provide account number:'
    acc_no = gets.chomp.to_i
    bank_account = find_by(acc_no)
    if bank_account
      bank_account
    else
      puts 'Account doesnt exists'
      services
    end
  end

  def self.find_by(acc_no)
    Bank.all.detect { |account| acc_no == account.number.to_i }
  end

  # @todo Instead of defining method as private in this way, place all private methods under private or use private :method_name, right below the method
  # This makes it difficult to figure out method is private when method is defined somewhere else in the file
  private_class_method :account
end

# @todo Instead of running program in this manner, invokve it from separate file ex. run_bank.rb
Bank.services

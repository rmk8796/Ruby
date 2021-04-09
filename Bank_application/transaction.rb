# Details of Transaction

class Transaction
  attr_reader :amount

  def initialize(amt)
    @amount = amt
  end

  # Prints individual transaction statement
  def statement
    if @amount.positive?
      "#{@amount.round(2).to_f}\t\t\t\t\t\tCredited in Bank "
    else
      "\t\t\t#{-@amount.round(2).to_f}\t\t\tDebited From Bank"
    end
  end
 end


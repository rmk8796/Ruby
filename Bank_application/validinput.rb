require 'bigdecimal'

module ValidInput
  def accept_amount(msg = 'Enter Amount')
    puts msg
    amt = gets.chomp
    if valid_amount?(amt)
      BigDecimal amt
    else
      accept_amount('Enter amount properly:')
    end
  end

  def accept_name(msg = 'Provide Account Name')
    puts msg
    name = gets.chomp
    if valid_name?(name)
      name
    else
      accept_name('Enter name properly:')
    end
  end

  def valid_amount?(amt)
    !!amt.match(/^[0-9.]+$/) && amt.to_i.positive?
  end

  def valid_name?(name)
    !!name.match(/^[A-Z\s]+$/i)
  end
end

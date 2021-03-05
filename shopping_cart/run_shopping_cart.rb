require 'bundler/setup'
require 'shopping_cart'

prompt = TTY::Prompt.new


# Interface to add product in mall
def add_product_in_mall(prompt)
  info = {}
  info[:name] = prompt.ask('Enter Name of Product', validate: /^[A-Z\s]+$/i)
  info[:quantity] = prompt.ask('Enter Quantity of Product', validate: /^[1-9][0-9\s]*$/i, convert: :int)
  info[:unit_price] = prompt.ask('Enter unit price', validate: /^[1-9][0-9.]*+$/, convert: :float)
  product = ShoppingCart::Product.find_by(info[:name])
  if product
    product.add_in_mall(info[:quantity])
  else
    puts ShoppingCart::Product.new(info)
  end
end

# Interface to assign a cart to user
def take_a_cart(prompt)
  name = prompt.ask('Enter Your name', validate: /^[A-Z\s]+$/i)
  cart = ShoppingCart::Cart.find_by(name)
  if cart
    prompt.say("Already assigned Cart with user name #{name}")
  else
    puts ShoppingCart::Cart.new(name)
  end
end

# Interface to add product in cart
def add_product_in_cart(prompt)
  id = prompt.ask('Enter Cart ID', convert: :int)
  cart = ShoppingCart::Cart.find_with(id)
  if cart
    name = prompt.ask('Enter Product name')
    product = ShoppingCart::Product.find_by(name)
    if product
      quantity = prompt.ask('Enter product quantity', validate: /^[0-9\s]+$/i, convert: :int)
      if product.available_quantity_mall?(quantity)
        cart.add_product(product, quantity)
      else
        prompt.say("Only #{product.available_quantity} #{product.name} are available in mall")
      end
    else
      prompt.say("#{name} not available in mall")
    end
  else
    prompt.say("Cart with ID : #{id} not present in system")
  end
end

# Interface to remove product from cart
def remove_product_from_cart(prompt)
  id = prompt.ask('Enter Cart ID', convert: :int)
  cart = ShoppingCart::Cart.find_with(id)
  if cart
    product_name = prompt.ask('Enter Product Name')
    cart_product = cart.find(product_name)
    if cart_product
      remove_quantity = prompt.ask('Enter product quantity', convert: :int)
      if cart_product[:quantity] >= remove_quantity
        cart.remove(cart_product, remove_quantity)
      else
        prompt.say("Only #{cart_product[:quantity]} #{cart_product[:product].name} are avilable in Cart")
      end
    else
      prompt.say("#{product_name} not available in cart")
    end
  else
    prompt.say("Cart with ID : #{id} not present in system")
  end
end

# Interface to display details of cart
def details_of_cart(prompt)
  id = prompt.ask('Enter Cart ID', convert: :int)
  cart = ShoppingCart::Cart.find_with(id)
  if cart
    puts cart.details
  else
    prompt.say("Cart with ID : #{id} not present in system")
  end
end

# Interface to checkout products from cart
def checkout(prompt)
  id = prompt.ask('Enter Cart ID', convert: :int)
  cart = ShoppingCart::Cart.find_with(id)
  if cart
    cart.checkout
  else
    prompt.say("Cart with ID : #{id} not present in system")
  end
end

# Display details of each product in mall
def product_list
  puts "Product name \t available quantity \t unit price"
  puts ShoppingCart::Product.all.map(&:details)
end

loop do
  case prompt.select('Enter your choice', ShoppingCart::Kiosk.menu, cycle: true)
  when 1 then add_product_in_mall(prompt)
  when 2 then take_a_cart(prompt)
  when 3 then add_product_in_cart(prompt)
  when 4 then remove_product_from_cart(prompt)
  when 5 then details_of_cart(prompt)
  when 6 then checkout(prompt)
  when 7 then product_list
  when 8 then return
  end
end


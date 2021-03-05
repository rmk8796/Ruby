require "shopping_cart/version"

# Gems
require 'tty-prompt'
# Classes and Modules from lib
require 'shopping_cart/cart'
require 'shopping_cart/product'
require 'shopping_cart/kiosk'

module ShoppingCart
  GEM_ROOT = Gem::Specification.find_by_name('shopping_cart').gem_dir
  class Error < StandardError; end
  # Your code goes here...
end

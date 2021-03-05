module ShoppingCart
  # Interface to access all operations of Shopping cart
  class Kiosk
    # Menu options
    #
    # @return [Hash]
    def self.menu
      [
        { name: '1. Add Product in Mall', value: 1 },
        { name: '2. Take a cart', value: 2 },
        { name: '3. Add Product in Shopping Cart', value: 3 },
        { name: '4. Remove Product from Shopping Cart', value: 4 },
        { name: '5. Show details of Cart', value: 5 },
        { name: '6. checkout', value: 6 },
        { name: '7. List of products in mall', value: 7 },
        { name: '8. Quit', value: 8 }
      ]
    end
  end
end

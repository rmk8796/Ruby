module ShoppingCart
  # Interface to perform cart operations
  class Cart

    # Collection of {Cart}
    @@carts = []

    # @return [Integer] id Id to identify cart
    attr_reader :id

    # @return [String] holder_name
    attr_reader :holder_name

    # Finds required cart by user name
    #
    # @return [Cart]
    def self.find_by(user_name)
      @@carts.detect { |cart| user_name == cart.holder_name }
    end

    # Finds required cart by id
    #
    # @return [Cart]
    def self.find_with(id)
      @@carts.detect { |cart| id == cart.id }
    end

    # Finds required product from cart
    #
    # @param [String] product_name
    # @return [Hash] Product present in cart with its quantity in cart
    def find(product_name)
      @cart.detect{ |cart_product| cart_product[:product].name == product_name }
    end

    # Initializes an empty cart
    #
    # @param [String] name Name of cart holder
    # @return [Cart]
    def initialize(name)
      @holder_name = name
      @cart = []
      @id = new_cart_id
      @@carts << self
      self
    end

    # @return [String]
    def to_s
      "#{holder_name} has taken cart with ID :#{id}"
    end

    # Interface to add a product in cart
    #
    # @param [Product] product Product from mall
    # @param [Integer] quantity Quantity of a product to be added in cart
    def add_product(product, quantity)
      return puts 'Enter some quantity to add' if quantity.zero?

      prod = {}
      @cart.map{ |cart_product| cart_product[:quantity] += quantity if cart_product[:product] == product }
      puts "#{quantity} #{product.name} has been added in cart"
      unless @cart.map{ |product| product[:product] }.include? product
        prod[:product] = product
        prod[:quantity] = quantity
        @cart << prod
      end
    end

    # Interface to remove product from cart
    #
    # @param [Hash] product Product present in cart with its quantity
    # @option product [Product] :product Product from mall
    # @option product [Integer] :quantity Quantity of product in cart
    # @param [Integer] remove_quantity Quantity of a product to be removed from cart
    # @return [String]
    def remove(product, remove_quantity)
      return puts 'Enter some quantity to remove' if remove_quantity.zero?

      @cart.map{ |cart_product| cart_product[:quantity] -= remove_quantity if cart_product == product }
      @cart.delete_if { |cart_prod| cart_prod[:quantity].zero? }
      puts "#{remove_quantity} #{product[:product].name} has been removed from cart"
    end

    # Details of cart cart
    #
    # @return [Array<String>] Detail of each product of cart
    def details
      puts "Product \t Quantity \t Price/piece \t total_Price"
      puts @cart.map{ |product| "#{product[:product].name} \t\t #{product[:quantity]} \t\t #{product[:product].price_per_piece} \t\t #{product[:product].price_per_piece * product[:quantity]}"}
    end

    # Checkout a cart
    #
    # @return [Array[void]]
    def checkout
      @cart.map{ |product| product[:quantity] = product[:product].available_quantity if product[:quantity] >= product[:product].available_quantity }
      @cart.map{ |product| product[:product].checkout(product[:quantity]) }
      details
      @cart.clear
    end

    private
    # Provides id to each cart
    #
    # @return [Integer]
    def new_cart_id
      @@carts.count + 1
    end
  end
end

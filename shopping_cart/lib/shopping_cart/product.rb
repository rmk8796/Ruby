module ShoppingCart
  # Details of a product
  class Product

    # Collection of {product}
    @@products = []

    # @return [String] name Name of product
    attr_reader :name

    # @return [Integer] available_quantity Total quantity in mall
    attr_reader :available_quantity

    # @return [Float] price_per_piece Unit price of a product
    attr_reader :price_per_piece

    # @return [Array<Product>]
    def self.all
      @@products
    end

    # Finds required product by name
    #
    # @param [String] name Name of product
    # @return [Product]
    def self.find_by(name)
      @@products.detect { |product| name == product.name }
    end

    # Add a product in mall
    #
    # @param [Hash] info Information of a product
    # @option info [String] :name Name of product
    # @option info [Float] :unit_price
    # @option info [Integer] :available_quantity Quantity available in mall
    def initialize(info)
      @name = info[:name]
      @price_per_piece = info[:unit_price]
      @available_quantity = info[:quantity]
      @@products << self
      self
    end

    # Statement after product has been added in mall
    #
    # @return [String]
    def to_s
      "#{available_quantity} #{name} has been added in Mall"
    end

    # @param [Integer] quantity Quantity of product to be added in mall
    # @return [String]
    def add_in_mall(quantity)
      @available_quantity += quantity
      puts "#{quantity} #{name} has been added in mall"
    end

    # @param [Integer] quantity
    # @return [Boolean]
    def available_quantity_mall?(quantity)
      quantity <= available_quantity
    end

    # Checkout cart product
    #
    # @param [Integer] quantity Quantity of a product to checkout
    def checkout(quantity)
      @available_quantity -= quantity
      @@products.delete_if { |product| product.available_quantity.zero? }
    end

    # Details of a product
    #
    # @return [String]
    def details
      "#{name} \t\t #{available_quantity} \t\t\t #{price_per_piece.round(2).to_f}"
    end
  end
end

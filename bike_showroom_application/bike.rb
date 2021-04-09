require 'liquid'
require './validate_input'
require './engine'

# Details of a bike
class Bike
  include ValidateInput

  # Collection of {bikes}
  @@bikes = []

  # @return [String] name
  attr_reader :name

  # @return [Engine]
  attr_reader :engine

  # @return [Float] milage
  attr_reader :milage

  # @return [Integer] top_speed
  attr_reader :top_speed

  # @return [Array<Bike>]
  def self.all
    @@bikes
  end

  # List of bikes present in showroom
  #
  # @return [Array<String>]
  def self.list
    puts @@bikes.map(&:name)
  end

  # Finds bike with provided name
  #
  # @param [String] name Bike name
  # @return [Bike]
  def self.find_by(name)
    @@bikes.detect { |bike| name == bike.name }
  end

  # Finds bike with max milage
  #
  # @return [Bike]
  def self.max_milage
    @@bikes.max_by(&:milage)
  end

  # Finds bike with max top speed
  #
  # @return [Bike]
  def self.max_top_speed
    @@bikes.max_by(&:top_speed)
  end

  # New bike
  #
  # @return [Bike]
  def initialize(name)
    @name = name
    @engine = Engine.new
    @milage = input_milage
    @top_speed = input_max_speed
    @@bikes << self
  end

  # Details of a bike
  #
  # @return [String]
  def to_s
    content = File.read File.join('./information.liquid')
    template = Liquid::Template.parse(content)
    template.render(
      'bike_name' => name,
      'displacement' => engine.displacement,
      'strokes' => engine.strokes,
      'cylinders' => engine.cylinders,
      'gears' => engine.gears,
      'bike_milage' => milage,
      'bike_top_speed' => top_speed
    )
  end

  # Change details of existing bike
  def change_details
    @engine = Engine.new
    @milage = input_milage
    @top_speed = input_max_speed
  end
end

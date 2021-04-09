require './validate_input'

# Information about engine
class Engine
  include ValidateInput

  # @return [Float] displacement Engine displacement
  attr_reader :displacement

  # @return [Integer] strokes
  attr_reader :strokes

  # @return [Integer] cylinders
  attr_reader :cylinders

  # @return [Integer] gears
  attr_reader :gears

  # Engine of a bike
  #
  # @return [Engine]
  def initialize
    @displacement = input_displacement
    @strokes = input_strokes
    @cylinders = input_cylinders
    @gears = input_gears
  end

  # Details of an bike engine
  #
  # @return [String]
  def details
    "Engine Displacement (CC)\t #{displacement}
     Stroke                  \t #{strokes}
     No Of Cylinders         \t #{cylinders}
     No Of Gears             \t #{gears}"
  end
end

# Validate input accepted from user
module ValidateInput
  # Validate accepted name of bike
  #
  # @return [String]
  def input_name(msg = 'Enter Bike Name')
    puts msg
    bike_name = gets.chomp
    if bike_name.match(/[A-Z]+$/i)
      bike_name
    else
      input_name('Enter bike name correctly')
    end
  end

  # Validate accepted displacement of bike
  #
  # @return [Float]
  def input_displacement(msg = 'Enter engine displacement(CC)')
    puts msg
    displacement = gets.chomp
    if displacement.match(/^[0-9.]+$/)
      displacement.to_f
    else
      input_displacement('Enter displacement value correctly')
    end
  end

  # Validate accepted strokes of bike
  #
  # @return [Integer]
  def input_strokes(msg = 'Enter Strokes')
    puts msg
    strokes = gets.chomp
    if strokes.match(/^[0-9]$/)
      strokes.to_i
    else
      input_strokes('Enter value of strokes')
    end
  end

  # Validate accepted cylinders of bike
  #
  # @return [Integer]
  def input_cylinders(msg = 'Enter no of cylinders')
    puts msg
    cylinders = gets.chomp
    if cylinders.match(/^[1-9]$/)
      cylinders.to_i
    else
      input_cylinders('Enter no of cylinders')
    end
  end

  # Validate accepted gears of bike
  #
  # @return [Integer]
  def input_gears(msg = 'Enter No of Gears')
    puts msg
    gears = gets.chomp
    if gears.match(/^[1-9]$/)
      gears.to_i
    else
      input_gears('Enter value of gears')
    end
  end

  # Validate accepted milage of bike
  #
  # @return [Float]
  def input_milage(msg = 'Enter milage(kmpl)')
    puts msg
    milage = gets.chomp
    if milage.match(/^[0-9.]+$/) && milage.to_i.positive?
      milage.to_i
    else
      input_milage('Enter value of gears')
    end
  end

  # Validate accepted top speed of bike
  #
  # @return [Integer]
  def input_max_speed(msg = 'Enter max speed(kmph)')
    puts msg
    speed = gets.chomp
    if speed.match(/^[0-9]+$/) && speed.to_i.positive?
      speed.to_i
    else
      input_max_speed('Enter top speed')
    end
  end
end

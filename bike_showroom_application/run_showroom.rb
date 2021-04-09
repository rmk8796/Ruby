require './bike'
require './validate_input'
include ValidateInput

# Display menu of showroom
def display
  options = [
    '********Welcome to BikeInfo********',
    '1. Add Bike',
    '2. Compare Bikes',
    '3. Change Bike Details',
    '4. List Bikes',
    '5. Find Bike with Max Milege',
    '6. Find Bike with Max Top Speed',
    '7. Quit',
    '***********************************'
  ]
  puts options.join("\n")
  puts 'Enter Your choice'
end

# Interface to add a new bike in showroom
def add_bike
  name = input_name
  bike = Bike.find_by(name)
  if bike
    puts 'Bike already present'
  else
    puts Bike.new(name)
  end
end

# Interface to compare two bikes
def compare_bikes
  bike_1 = Bike.find_by(input_name)
  bike_2 = Bike.find_by(input_name)
  if bike_1 && bike_2
    puts bike_1, bike_2
  else
    puts 'Bike not present'
  end
end

# Interface to change details of bike
def change_bike_details
  name = input_name
  bike = Bike.find_by(name)
  if bike
    bike.change_details
  else
    puts 'Bike doesnt exists'
  end
end

# Interface to display details of bike with max milage
def bike_with_max_milage
  if Bike.all.empty?
    puts 'Add bike first'
  else
    puts Bike.max_milage
  end
end

# Interface to display details of bike with max top speed
def bike_with_max_speed
  if Bike.all.empty?
    puts 'Add bike first'
  else
    puts Bike.max_top_speed
  end
end

loop do
  display
  case gets.chomp.to_i
  when 1 then add_bike
  when 2 then compare_bikes
  when 3 then change_bike_details
  when 4 then Bike.list
  when 5 then bike_with_max_milage
  when 6 then bike_with_max_speed
  when 7 then return
  else
    puts 'Try again!'
  end
end

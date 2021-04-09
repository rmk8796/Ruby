require './validinput'
include ValidInput
require './classroom'

def display
  options = [
    '1. Create Class Room',
    '2. Add Students in Class Room',
    '3. List Students in Class Room',
    '4. Quit'
  ]
  puts options.join("\n")
  puts 'Choose an option'
end

def create_classroom
  classroom_name = input_classroom_name
  classroom = ClassRoom.find_by(classroom_name)
  if classroom
    puts 'Classroom Already Exists'
  else
    ClassRoom.new(classroom_name).to_s
  end
end

def add_students
  classroom_name = input_classroom_name
  classroom = ClassRoom.find_by(classroom_name)
  if classroom
    classroom.add_students
  else
    puts 'classroom doesnt exists'
  end
end

def students_list
  classroom_name = input_classroom_name
  classroom = ClassRoom.find_by(classroom_name)
  if classroom
    classroom.list_of_students
  else
    puts 'ClassRoom Doesnt Exists'
  end
end

loop do
  display
  case gets.chomp.to_i
  when 1 then create_classroom
  when 2 then add_students
  when 3 then students_list
  when 4 then return
  else
    puts 'Wrong Choice!'
  end
end

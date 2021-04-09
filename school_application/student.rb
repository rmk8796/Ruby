# Necessary details of student
# @todo Student class is described in appropriately in above comment

require './validinput'

class Student
  include ValidInput

  attr_reader :roll_no, :name, :birthdate, :percentage

  def initialize
    @roll_no = input_roll_number
    @name = input_name
    @birthdate = input_date_of_birth
    @percentage = input_percentage
  end

  def details
    "#{@roll_no}\t\t#{@name}\t\t#{@birthdate}\t\t#{@percentage}"
  end
end

# Interface to classroom operations

require './student'

class ClassRoom
  @@classrooms = []

  attr_reader :name

  def self.all
    @@classrooms
  end

  def initialize(name)
    @name = name
    @students = []
    @@classrooms << self
  end

  def to_s
    puts "classroom for #{name} has been created"
  end

  def add_students
    puts 'Add Number of Students'
    student_count = gets.chomp.to_i
    (1..student_count).each do |count|
      puts "Enter Details of Student #{count}"
      @students << Student.new
    end
    puts "#{student_count} Students has been added in #{name}"
  end

  def list_of_students
    puts 'Students list'
    puts name
    @students.sort_by!(&:name)
    puts "Roll Number\t\tName\t\tBirth Date\t\tPercentage"
    puts @students.map(&:details)
  end

  def self.find_by(classroom_name)
    ClassRoom.all.detect { |classroom| classroom_name == classroom.name }
  end
end

module ValidInput
  private

  def input_roll_number(msg = 'Enter Roll Number')
    puts msg
    roll = gets.chomp
    if valid_roll_no?(roll)
      roll
    else
      input_roll_number('Enter numbers only: Ex - 21')
    end
  end

  def input_name(msg = 'Enter Name')
    puts msg
    stud_name = gets.chomp
    if valid_name?(stud_name)
      stud_name
    else
      input_name('Enter name properly.')
    end
  end

  def input_date_of_birth(msg = 'Enter Birthdate')
    puts msg
    birth_date = gets.chomp
    if valid_birthdate?(birth_date)
      birth_date
    else
      input_date_of_birth('Enter valid birth date: Ex - 24 Sep 1998')
    end
  end

  def input_percentage(msg = 'Enter percentage')
    puts msg
    stud_percentage = gets.chomp
    if valid_percentage?(stud_percentage)
      stud_percentage
    else
      input_percentage('Enter valid percentage: Ex - 91')
    end
  end

  def input_classroom_name(msg = 'Provide Name of ClassRoom:')
    puts msg
    classname = gets.chomp
    if valid_classname?(classname)
      classname
    else
      input_classroom_name('Enter a valid name for class: Example - 10th')
    end
  end

  def valid_classname?(classname)
    !!classname.match(/[0-9]+[A-Z\s]+$/i)
  end

  def valid_name?(stud_name)
    !!stud_name.match(/^[A-Z\s]+$/i)
  end

  def valid_birthdate?(date_of_birth)
    !!date_of_birth.match(/^([1-9]|[1-2][0-9]|3[01])\s(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s[1-2]\d\d\d$/)
  end

  def valid_percentage?(percentage)
    !!percentage.match(/^[0-9]+$/) && percentage.length <= 3 && percentage.to_i.positive?
  end

  def valid_roll_no?(roll)
    !!roll.match(/^[0-9]+$/) && roll.length <= 3 && roll.to_i.positive?
  end
end

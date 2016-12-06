# lets put all the students into an array
def input_students
  puts "Please enter the name of the student.".center(50)
  puts "To finish, just hit return twice.".center(50)
  # create an empty array
  students = []
  cohorts = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december, '']
  # get the first name
  name = gets.chomp
  # while the name is not empty repeat this code
  puts "What cohort are they in?".center(50)
  cohort = gets.chomp
  unless (cohorts.include? cohort.downcase.to_sym) || (cohort == '')
    puts "I'm sorry, that's the wrong spelling. Please enter it again:".center(50)
    cohort = gets.chomp
  end
  until name.empty? && cohort.empty? do
    # add the student to the hash array
    students << {name: (name.empty? ? :unknown : name), cohort: (cohort.empty? ? :unknown : cohort.downcase.to_sym)}
    puts "Now we have #{students.count} students".center(50)
    # get another name from the user
    puts "Please add the name of the next student".center(50)
    name = gets.chomp
    puts "What cohort are they in?"
    cohort = gets.chomp
    unless (cohorts.include? cohort.downcase.to_sym) || (cohort == '')
      puts "I'm sorry, that's the wrong spelling. Please enter it again:".center(50)
      cohort = gets.chomp
    end
  end
  # return the array of students
  students
end

# and then we print them
def print_header
  puts "The students of Villains Academy".center(50)
  puts "----------".center(50)
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} is in cohort #{student[:cohort]}.".center(50)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

def print_list(students)
  if students.length >= 1
    print_header
    print(students)
    print_footer(students)
  else
    puts "There are no students".center(50)
  end
end

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and save it to a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when '1'
      students = input_students
    when '2'
      print_list(students)
    when '9'
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant. Try again"
    end
  end
end

interactive_menu

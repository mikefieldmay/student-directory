# lets put all the students into an array
@students =[]
def input_students
  puts "Please enter the name of the student.".center(50)
  puts "To return to the main menu, just hit return twice.".center(50)
  # create an empty array
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
    @students << {name: (name.empty? ? :unknown : name), cohort: (cohort.empty? ? :unknown : cohort.downcase.to_sym)}
    puts "Now we have #{@students.count} students".center(50)
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
end

# and then we print them
def print_header
  puts "The students of Villains Academy".center(50)
  puts "----------".center(50)
end

def print()
  @students.each do |student|
    puts "#{student[:name]} is in cohort #{student[:cohort]}.".center(50)
  end
end

def print_footer()
  puts "Overall, we have #{@students.count} great students".center(50)
end

def print_list()
  if @students.length >= 1
    print_header
    print()
    print_footer()
  else
    puts "There are no students".center(50)
  end
end

def print_menu
  # 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of current students to csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def process(selection)
  case selection
  when '1'
    input_students
  when '2'
    print_list()
  when '3'
    save_students
    puts "File has been saved"
  when '4'
    load_students
    puts "Students loaded from previous session"
  when '9'
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant. Try again".center(50)
  end
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  # iterate over teh array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu

require 'csv'
  @students = [] # an empty array accessible to all methods

  def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list of students"
    puts "4. Load the list of students from a chosen file"
    puts "9. Exit" # 9 because we'll be adding more items
  end

  def interactive_menu
    loop do
      print_menu
      menu_choice(STDIN.gets.chomp)
    end
  end

  def menu_choice(selection)
    case selection
    when "1"
      puts "You chose option 1. Input the students:"
      input_students
    when '2'
      puts "You chose option 2. Show the students:"
      show_students
    when "3"
      puts "You chose option 3. Save the list of students"
      save_students
    when "4"
      puts "You chose option 4. Load the list of students from a chosen file:"
      puts "Please enter the filename"
      load_students
    when "9"
      puts "Goodbye for now"
        exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end

  def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # get the first name
    name = STDIN.gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
      # add the student hash to the array
      add_to_student_array(name)
      puts "Now we have #{@students.count} students"
      # get another name from the user
      name = STDIN.gets.chomp
    end
  end

  def show_students
    print_header
    print_student_list
    print_footer
  end

  def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end

  def print_student_list
    @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end

  def print_footer
    puts "Overall, we have #{@students.count} great students"
  end

  def save_students
    # open the file for writing
    puts "Please enter the file to save to:"
    filename = STDIN.gets.chomp
    if File.exist?(filename)
      puts "We'll be overwriting the previous file. Type 'y' to proceed or 'n' to cancel"
      choice = STDIN.gets.chomp
      loop do
      if choice == 'y'
        file_write(filename)
        break
      elsif choice == 'n'
        puts "Okay, returning to main menu"
        return
      else
        puts "I'm sorry, I didn't understand that"
        puts "Please enter your choice again"
        choice = STDIN.gets.chomp
      end
    end
    else
        puts "We'll create a new file"
        file_write(filename)
    end
  end

  def file_write(filename)
    CSV.open(filename, "wb") do |file|
      # iterate over the array of students
      @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        file << student_data
      end
      puts "#{filename} has been written"
    end
  end

  def load_students(filename = STDIN.gets.chomp)
    if File.exist?(filename)
      CSV.foreach(filename) do |line|
          name, cohort = line[0], line[1]
          add_to_student_array(name, cohort)
        end
        puts "#{filename} has been successfully loaded."
    else
      puts "I'm sorry, we've got no record of that file. Returning to the main menu"
      return
    end

  end

  def try_load_students
    filename = ARGV.first# first argument from the command line
    return if filename.nil? # get out of the method if it isn't given
    if File.exists?(filename) # if it exists
      load_students(filename)
       puts "Loaded #{@students.count} from #{filename}"
    else # if it doesn't exist
      puts "Sorry, #{filename} doesn't exist."
      exit # quit the program
    end
  end

  def add_to_student_array(name, cohort = :november)
    @students << {name: name, cohort: cohort.to_sym }
  end

  try_load_students
  interactive_menu

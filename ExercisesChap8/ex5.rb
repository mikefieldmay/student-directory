# lets put all the students into an array
def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit return twice."
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty repeat this code
  while !name.empty? do
    # add the student to the hash array
    puts "What cohort is he a part of?: "
    cohort = gets.chomp
    puts "Any hobbies: "
    hobbies = gets.chomp
    puts "And where is their home town?: "
    home_town = gets.chomp 
    students << {name: name, cohort: cohort, hobbies: hobbies, home_town: home_town}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Name of next student please"
    name = gets.chomp
  end
  # return the array of students
  students
end

# and then we print them
def print_header
  puts "The students of Villains Academy"
  puts "----------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
    puts "#{student[:name]} is from #{student[:home_town]} and #{student[:name]}\'s hobbies include: #{student[:hobbies]}"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students

print_header
print(students)
print_footer(students)

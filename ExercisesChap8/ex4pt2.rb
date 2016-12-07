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
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
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
  x = 0
  until x == students.length
    puts "#{(students[x])[:name]} is in the #{(students[x])[:cohort]} cohort"
    x += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students

print_header
print(students)
print_footer(students)
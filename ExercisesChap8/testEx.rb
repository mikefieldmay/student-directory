# lets put all the students into an array
def input_students
  puts "Please enter the names of the students.".center(20)
  puts "To finish, just hit return twice.".center(20)
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty repeat this code
  while !name.empty? && !cohort.empty? do
    # add the student to the hash array
    puts "What cohort are they in?"
    cohort = gets.chomp

    students << {name: name, cohort: (cohort.to_s == '' ? :unknown : cohort)}
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
  students.each do |student|
    puts "#{student[:name]} is in cohort #{student[:cohort]}."
    puts "#{student[:name]} is aged #{student[:age]} and is from #{student[:home_town]}"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students

print_header
print(students)
print_footer(students)

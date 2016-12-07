# lets put all the students into an array
def input_students
  puts "Please enter the name of the student.".center(20)
  puts "To finish, just hit return twice.".center(20)
  # create an empty array
  students = []
  cohorts = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december, '']
  # get the first name
  name = gets.gsub("\n", '')
  # while the name is not empty repeat this code
  puts "What cohort are they in?"
  cohort = gets.strip
  unless cohorts.include? cohort.downcase.to_sym
    puts "I'm sorry, that's the wrong spelling. Please enter it again:"
    cohort = gets.gsub("\n", '')
  end
  until name.empty? && cohort.empty? do
    # add the student to the hash array
    students << {name: (name.empty? ? :unknown : name), cohort: (cohort.empty? ? :unknown : cohort.downcase.to_sym)}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Please add the name of the next student"
    name = gets.gsub("\n", '')
    puts "What cohort are they in?"
    cohort = gets.gsub("\n", '')
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
  end
end

def print_footer(students)
  if students.length > 1
    puts "Overall, we have #{students.count} great students"
  elsif students.length == 1
    puts "Overall, we have 1 great student."
  else
    puts "Oh no, we don't seem to have any students at all. Someone's getting fired for this."
  end
end

students = input_students

print_header
print(students)
print_footer(students)

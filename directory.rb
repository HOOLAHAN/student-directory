@students = []
# get the user to input list of students
def input_students
  puts "Please enter the names of students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
      name = gets.chomp
  end
end

# header 
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# print students out ordered by entry number
def print_students_list
  counter = 0
  while counter < @students.length
    @students.each_with_index() do |student, index|
    puts "#{index + 1} #{student[:name]}" + "  cohort: #{student[:cohort]}"
    counter += 1
    end
  end
end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student"
  else
    puts "Overall, we have #{names.count} great students"
  end
end

def interactive_menu
  loop do
    print_menu # print the menu and ask user what to do
    process(gets.chomp) # read the input and save it to a variable then do what the user asked
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer(@students)
end

def save_students
  # open a file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def process(selection)
  case selection
    when "1"
      input_students # input the students 
    when "2"
      show_students # show the students
    when "3"
      save_students
    when "9"
      exit # terminate the program
    else
      puts "I don't know what you meant, please try again."
  end
end

interactive_menu

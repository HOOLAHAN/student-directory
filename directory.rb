@students = [] # get the user to input list of students

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu # print the menu and ask user what to do
    process(STDIN.gets.chomp) # read the input and save it to a variable then do what the user asked
  end
end

def process(selection)
  case selection
    when "1"
      input_students # input the students 
    when "2"
      show_students # show the students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # terminate the program
    else
      puts "I don't know what you meant, please try again."
  end
end

def input_students
  try_load_students
  puts "Please enter the names of students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do # while the name isn't empty repeat this code
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
      name = gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer(@students)
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
    puts "#{index + 1} #{student[:name]}" + "    cohort: #{student[:cohort]}"
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

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it doesn't exist
  if File.exist?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit # quit the program
  end
end

try_load_students
interactive_menu

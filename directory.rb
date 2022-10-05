def input_students
  students = []
  puts "Please enter the name of first student"
  name = gets.chomp
  if !name.empty?
    puts "Please enter the cohort of first student"
    cohort = gets.chomp.to_sym
    puts "Please enter the country of birth of first student"
    country = gets.chomp.to_sym
    puts "Please enter the height of first student (in cm)"
    height = gets.chomp
  end

  while !name.empty? do
    students << {name: name, cohort: cohort, country_of_birth: country, height: height}
    puts "Now we have #{students.count} students"
    if name == nil
      break
    else
      puts "Please enter the name of next student"
      name = gets.chomp
      puts "Please enter the cohort of next student"
      cohort = gets.chomp.to_sym
      puts "Please enter the country of birth of next student"
      country = gets.chomp.to_sym
      puts "Please enter the height of next student"
      height = gets.chomp
    end
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  counter = 0
  while counter < students.length
    students.each_with_index() do |student, index|
    puts "#{index + 1} #{student[:name]}"
    puts "cohort: #{student[:cohort]}"
    puts "country of birth: #{student[:country_of_birth]}"
    puts "height: #{student[:height]}cm"
    counter += 1
    end
  end
end

def group(students)
  students_by_cohort = {}
  students.each do |student|
    cohort = student[:cohort]
    if students_by_cohort[cohort] == nil
      students_by_cohort[cohort] = []
    end
    students_by_cohort[cohort].push(student[:name])
  end
  puts students_by_cohort
  students_by_cohort.each do |k, v|
    puts k
    puts v
  end
end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student"
  else
    puts "Overall, we have #{names.count} great students"
  end
end

students = input_students

if !input_students.empty?
  print_header
  print(students)
  print_footer(students)
  group(students)
else
  puts "Empty"
end

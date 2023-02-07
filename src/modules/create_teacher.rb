require_relative '../teacher'

class CreateTeacher
  def create(people)
    puts "Age: \n"
    age = gets.chomp.to_i
    puts 'Age must be a number' unless (age.is_a? Integer) && age.positive? && age < 100

    puts "Name: \n"
    name = gets.chomp
    puts 'Name too long' unless name.length.positive? && name.length < 100

    puts "Specialization: \n"
    specialiation = gets.chomp
    specialiation = specialiation.downcase
    people.push(Teacher.new(age, name, specialiation))
    puts 'Teacher created successfully'
  end
end

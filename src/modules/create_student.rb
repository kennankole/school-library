require_relative '../student'

class CreateStudent
  def create(people_list)
    puts "Enter age:\n"
    age = gets.chomp.to_i
    puts 'Age must be a number' unless (age.is_a? Integer) && age > 1 && age < 100

    puts 'Name:'
    name = gets.chomp
    return puts 'Name too long' unless name.length.positive? && name.length < 50

    puts "Parent authorization? [Y/N]\n"
    parent_permission = gets.chomp
    parent_permission = parent_permission.downcase == 'y'

    people_list.push(Student.new(age, name, parent_permission: parent_permission))
    puts "Student created successfully\n"
  end
end

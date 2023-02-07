require_relative '../../persons'
require_relative '../create_teacher'
require_relative '../create_student'

class PeopleClass
  def display(people)
    if people.empty?
      puts 'There are not people yet'
    else
      people.each_with_index do |person, index|
        puts "[#{index}] Name: #{person.name}\n Age: #{person.age} ID: #{person.id}"
      end
    end
  end

  def create(people)
    puts "Do you want to create a student (1) or a teacher (2)? \n"
    person_class = gets.chomp.to_i
    case person_class
    when	1
      CreateStudent.new.create(people)
    when 2
      CreateTeacher.new.create(people)
    end
  end
end

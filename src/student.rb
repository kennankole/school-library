require './src/persons'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom)
    super(name, age)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

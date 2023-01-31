require "./src/persons.rb"

class Student < Person
	attr_accessor :classroom

	def initialize(classroom)
		super(name, age)
		@classroom = classroom
	end

	def play_hooky
		return '¯\(ツ)/¯'
	end
end
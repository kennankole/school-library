require "./src/persons.rb"

class Teacher < Person
	attr_accessor :specialization

	def initialize(specialization)
		super(age, name='Unknown', parent_permission=true)
		@specialization = specialization
	end

	def can_use_services?
		return true
	end
end

teach = Teacher.new("Mathematics")
puts teach.can_use_services?

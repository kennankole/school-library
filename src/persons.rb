class Person
	attr_reader :id
	attr_accessor :name, :age
	def initialize(id, age, name='Unknown', parent_permission=true)
		@id = id
		@name = name 
		@age = age
		@parent_permission = parent_permission 
	end

	def is_of_age?
		if age&.>= 18
			return true
		else 
			return false
		end
	end

	def can_use_services?
		if @age >= 18 && @parent_permission == true
			return true
		else
			return false
		end
	end
end

one_person = Person.new(1, 5);
puts one_person.can_use_services?
puts one_person.is_of_age?
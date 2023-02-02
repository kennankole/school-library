class Person
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    return true if @age >= 18 && @parent_permission == true

    false
  end

  def book=(book)
    @book = book
    book.persons.push(self) unless book.persons.include?(self)
  end
end

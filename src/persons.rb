class Person
  @all_people = []
  attr_reader :id, :rentals, :parent_permission
  attr_accessor :name, :age

  def initialize(id, age, name, parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    @all_people << self
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

  def self.all
    @all_people.each_with_index { |person, idx| puts "#{[idx]} #{person}" }
  end

  def list_by_index(idx)
    @all_people[idx]
  end
end

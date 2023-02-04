require './names.rb'

class Person < Nameable
  @all_people = []
  attr_reader :id, :rentals, :parent_permission
  attr_accessor :name, :age
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
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

  def correct_name
    name
  end
end

class BaseDecorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name[0, 10]
  end
end

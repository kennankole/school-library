class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def all_books
    @book
  end

  def all_people
    @person
  end
end

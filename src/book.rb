class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @all_books = []
  end

  def add_persons(person)
    @persons.push(person)
  end
end

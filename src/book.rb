class Book
  @all_books = []
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @all_books << self
  end

  def add_persons(person)
    @persons.push(person)
  end

  def self.all
    @all_books.each_with_index { |n, idx| print "#{[idx]} Book title: #{n.title} Author: #{n.author} \n" }
  end
end

require_relative '../../book'

class BookClass
  def create(books)
    puts "Title: \n"
    title = gets.chomp
    return puts 'Title must too long' unless title.length.positive? && title.length < 150

    puts "Author: \n"
    author = gets.chomp
    return puts 'Author too/short long' unless author.length.positive? && author.length < 150

    books.push(Book.new(title, author))
    puts "Book created successfully\n"
  end

  def display(books)
    if books.empty?
      puts 'There are no books in the library yet!!'
    else
      books.each_with_index do |book, index|
        puts "[#{index}] Title: #{book.title}\n Author: #{book.author}\n"
      end
    end
  end
end

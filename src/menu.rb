require './book'
require './rental'
require './student'
require './teacher'
require './persons'

class App
  def initialize
    @book_list = []
    @people_list = []
    @rental_list = []
    @user_menu = "
			Please choose an option by entering a number:
			1 - List all books
			2 - List all people
			3 - Create a person
			4 - Create a book
			5 - Create a rental
			6 - List all rentals for a given person id
			7 - Exit
		"
  end

  def menu
    loop do
      puts @user_menu
      @input = gets.chomp.to_i
      users_selection(@input)
      break if @input == 7
    end
  end

  def users_selection(users_input)
    case users_input
    when 1
      list_books
    when 2
      all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_all_rentals_by_id
    else
      puts 'Thank you for using this app'
    end
  end

  def list_books
    if @book_list.empty?
      puts 'There are no book in the library yet!!'
    else
      @book_list.each do |book|
        puts "Title: #{book.title}\n Author: #{book.author}\n"
      end
    end
  end

  def all_people
    if @people_list.empty?
      puts 'There are not people yet'
    else
      @people_list.each do |person|
        puts "Name: #{person.name}\n Age: #{person.age}"
      end
    end
  end

  def create_student
    puts "Enter age:\n"
    age = gets.chomp.to_i
    puts 'Age must be a number' unless (age.is_a? Integer) && age > 1 && age < 100

    puts 'Name:'
    name = gets.chomp
    return puts 'Name too long' unless name.length.positive? && name.length < 50

    puts "Parent authorization? [Y/N]\n"
    parent_permission = gets.chomp
    parent_permission = parent_permission.downcase == 'y'

    @people_list << Student.new(id, age, name, parent_permission: parent_permission)
    puts "Student created successfully\n"
  end

  def create_teacher
    puts "Age: \n"
    age = gets.chomp.to_i
    puts 'Age must be a number' unless (age.is_a? Integer) && age.positive? && age < 100

    puts "Name: \n"
    name = gets.chomp
    puts 'Name too long' unless name.length.positive? && name.length < 100

    puts "Specialization: \n"
    specialiation = gets.chomp
    specialiation = specialiation.downcase
    @people_list << Teacher.new(id, age, name, specialiation)
    puts 'Teacher created successfully'
  end

  def create_book
    puts "Title: \n"
    title = gets.chomp
    return puts 'Title must too long' unless title.length.positive? && title.length < 150

    puts "Author: \n"
    author = gets.chomp
    return puts 'Author too/short long' unless author.length.positive? && author.length < 150

    @book_list << Book.new(title, author)
    puts "Book created successfully\n"
  end

  def create_rental
    return puts "There are no books/people registered yet\n" if @book_list.empty? || @people_list.empty?

    puts "Select a book by id\n"
    @book_list.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}\n"
    end
    book_rented = @book_list[gets.chomp.to_i]

    puts "Select a person from the following list by number \n"
    @people_list.each_with_index do |person, index|
      puts "#{index}) #{person.id} Name: #{person.name}"
    end
    person_renting = @people_list[gets.chomp.to_i]

    print "Date: \n"
    renting_date = gets.chomp
    @rental_list << Rental.new(renting_date, book_rented, person_renting)
    puts 'Rental created successfully'
  end

  def list_all_rentals_by_id
    return puts 'There are not people registered yet' if @people_list.empty?

    puts "ID of person: \n"
    id = gets.chomp.to_i

    rentals_of_person_by_id = @rental_list.filter_map.with_index	{ |rental, index| rental if index == id }
    return puts "There is no rental for this person \n" if rentals_of_person_by_id.empty?

    rentals_of_person_by_id.each do |rental|
      puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}\n"
    end
  end

  def create_person
    puts "Do you want to create a student (1) or a teacher (2)? \n"
    person_class = gets.chomp.to_i
    case person_class
    when	1
      create_student
    when 2
      create_teacher
    end
  end

  def error_message(message = nil)
    status = yield
    return unless status

    if message.nil?
      puts "Successs\n"
    else
      puts "#{message}\n"
    end
    true
  end
end

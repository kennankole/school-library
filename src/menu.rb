require_relative './modules/refactored/book_class'
require_relative './modules/refactored/person_class'
require_relative './modules/refactored/rentals_class'

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

  def main
    loop do
      puts @user_menu
      @input = gets.chomp.to_i
      menu(@input)
      break if @input == 7
    end
  end

  def menu(users_input)
    case users_input
    when 1
      fetch_all_books
    when 2
      fetch_all_people
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

  def fetch_all_books
    BookClass.new.display(@book_list)
  end

  def fetch_all_people
    PeopleClass.new.display(@people_list)
  end

  def create_book
    BookClass.new.create(@book_list)
  end

  def create_rental
    RentalClass.new.create(@book_list, @rental_list, @people_list)
  end

  def list_all_rentals_by_id
    RentalClass.new.display(@rental_list)
  end

  def create_person
    PeopleClass.new.create(@people_list)
  end
end

require_relative '../../rental'
require_relative './person_class'
require_relative './book_class'

class RentalClass
  def display(rentals)
    return puts 'There are not people registered yet ' if rentals.empty?

    puts "ID of person: \n"
    id = gets.chomp.to_i

    rentals_of_person_by_id = rentals.filter_map { |person| person if person.person.id == id }
    return puts "There is no rental for this person \n" if rentals_of_person_by_id.empty?

    rentals_of_person_by_id.each do |rental|
      puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}\n"
    end
  end

  def create(books, rentals, people)
    return puts "There are no books/people registered yet\n" if books.empty? || people.empty?

    puts "Select a book by number\n"
    BookClass.new.display(books)
    book_rented = books[gets.chomp.to_i]

    puts "Select a person from the following list by number \n"
    PeopleClass.new.display(people)
    person_renting = people[gets.chomp.to_i]

    print "Date: \n"
    renting_date = gets.chomp
    rentals.push(Rental.new(renting_date, book_rented, person_renting))
    puts 'Rental created successfully'
  end
end

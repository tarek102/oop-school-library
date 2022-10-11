require_relative './rental'

class RentalRecords
  attr_reader :list

  def initialize
    @list = []
  end

  def create_rental(books, people)
    return unless books.length.positive?

    puts 'Select a book from the following list by number'
    books.each_with_index do |book, index|
      puts "#{index + 1}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_choice = gets.chomp.to_i - 1
    puts 'select a person from the following list by number (not id)'
    return unless people.list.length.positive?

    people.list.each_with_index do |person, i|
      puts "#{i + 1}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_choice = gets.chomp.to_i - 1
    puts 'Date: '
    date_choice = gets.chomp
    rental = Rental.new(date_choice, people.list[person_choice], books[book_choice])
    @list << rental
    puts 'Rental created successfully'
  end

  def list_rentals(people)
    if @list.length.positive?
      print 'ID of person : '
      person_id = gets.chomp.to_i
      people.list.each do |person|
        next unless person.id == person_id

        person.rentals.each_with_index do |rental, _i|
          puts " \n Rented on: #{rental.date} \n, Book \"#{rental.book.title}\" by #{rental.book.author}\n"
        end
        puts "\n"
      end

    else
      puts 'Rentals list is empty'
    end
  end
end

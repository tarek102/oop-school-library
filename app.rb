require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'person'
require_relative './rental_records'
require_relative 'book_records'
require_relative 'people'
require_relative 'people_records'

class App
  attr_accessor :rentals, :books, :people

  def initialize(rental_records = RentalRecords.new)
    @rentals = rental_records
    @books = BookRecords.new
    @people = []
    @people = PeopleRecords.new
  end
end

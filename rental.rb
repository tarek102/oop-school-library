class Rental
  attr_accessor :date, :person, :book

  def initialize(date, pesron, book)
    @date = date
    @person = pesron
    @book = book

    book.rentals.push(self)
    person.rentals.push(self)
  end
end

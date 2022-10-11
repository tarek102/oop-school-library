class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(person, date, self)
    @rentals.push(rental)
    person.rentals.push(rental)
  end

  def to_json(*_args)
    {
      JSON.create_id => self.class.name,
      'title' => @title,
      'author' => @author
    }
  end
end

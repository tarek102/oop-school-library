require_relative 'book'

class Books
  attr_accessor :books
  def initialize(books)
    @books = books
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def list_books
    if @books.length.positive?
      @books.each do |book|
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
    else
      puts 'The book list is empty'
    end
  end
end
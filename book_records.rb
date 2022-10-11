require_relative 'book'

class BookRecords
  attr_reader :list
  def initialize
    @list = []
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @list << book
    puts 'Book created successfully'
  end

  def list_books
    if @list.length.positive?
      @list.each do |book|
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
    else
      puts 'The book list is empty'
    end
  end
end